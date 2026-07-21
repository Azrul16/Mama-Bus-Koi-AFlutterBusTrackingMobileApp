import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drift/drift.dart' hide Column;
import 'package:uuid/uuid.dart';

import '../../../core/database/app_database.dart' as db;
import '../../chat/domain/entities/chat_message.dart';
import '../../chat/domain/repositories/chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  ChatRepositoryImpl(this._local, this._remote);
  final db.AppDatabase _local;
  final FirebaseFirestore _remote;

  @override
  Stream<List<ChatMessage>> watchMessages(String organizationId) async* {
    await purgeExpired(organizationId);
    final cached =
        await (_local.select(_local.chatMessages)
              ..where((row) => row.organizationId.equals(organizationId))
              ..orderBy([(row) => OrderingTerm.asc(row.createdAt)]))
            .get();
    yield cached
        .map(
          (row) => ChatMessage(
            id: row.id,
            organizationId: row.organizationId,
            senderId: row.senderId,
            senderName: row.senderName,
            text: row.messageText,
            createdAt: row.createdAt,
            expiresAt: row.expiresAt,
          ),
        )
        .where((message) => !message.expired)
        .toList();
    await for (final snapshot
        in _remote
            .collection('organizations')
            .doc(organizationId)
            .collection('chat_messages')
            .where('expiresAt', isGreaterThan: Timestamp.now())
            .orderBy('expiresAt')
            .limitToLast(200)
            .snapshots()) {
      final messages = snapshot.docs.map((document) {
        final data = document.data();
        final createdAt =
            (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now();
        return ChatMessage(
          id: document.id,
          organizationId: organizationId,
          senderId: data['senderId'] as String? ?? '',
          senderName: data['senderName'] as String? ?? 'Member',
          text: data['text'] as String? ?? '',
          createdAt: createdAt,
          expiresAt:
              (data['expiresAt'] as Timestamp?)?.toDate() ??
              createdAt.add(const Duration(hours: 2)),
        );
      }).toList()..sort((a, b) => a.createdAt.compareTo(b.createdAt));
      await _local.transaction(() async {
        await (_local.delete(
          _local.chatMessages,
        )..where((row) => row.organizationId.equals(organizationId))).go();
        for (final message in messages) {
          await _local
              .into(_local.chatMessages)
              .insert(
                db.ChatMessagesCompanion.insert(
                  id: message.id,
                  organizationId: organizationId,
                  senderId: message.senderId,
                  senderName: message.senderName,
                  messageText: message.text,
                  createdAt: message.createdAt,
                  expiresAt: message.expiresAt,
                ),
                mode: InsertMode.insertOrReplace,
              );
        }
      });
      yield messages.where((message) => !message.expired).toList();
    }
  }

  @override
  Future<void> purgeExpired(String organizationId) async {
    final snapshot = await _remote
        .collection('organizations')
        .doc(organizationId)
        .collection('chat_messages')
        .where('expiresAt', isLessThanOrEqualTo: Timestamp.now())
        .limit(100)
        .get();
    if (snapshot.docs.isEmpty) return;
    final batch = _remote.batch();
    for (final document in snapshot.docs) {
      batch.delete(document.reference);
    }
    await batch.commit();
    await (_local.delete(_local.chatMessages)
          ..where((row) => row.expiresAt.isSmallerOrEqualValue(DateTime.now())))
        .go();
  }

  @override
  Future<void> send({
    required String organizationId,
    required String senderId,
    required String senderName,
    required String text,
  }) async {
    final trimmed = text.trim();
    if (trimmed.isEmpty) return;
    final now = DateTime.now();
    final id = const Uuid().v4();
    await _remote
        .collection('organizations')
        .doc(organizationId)
        .collection('chat_messages')
        .doc(id)
        .set({
          'organizationId': organizationId,
          'senderId': senderId,
          'senderName': senderName,
          'text': trimmed,
          'createdAt': FieldValue.serverTimestamp(),
          'expiresAt': Timestamp.fromDate(now.add(const Duration(hours: 2))),
        });
  }
}
