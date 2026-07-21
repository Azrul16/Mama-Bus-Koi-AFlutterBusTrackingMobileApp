import '../entities/chat_message.dart';

abstract interface class ChatRepository {
  Stream<List<ChatMessage>> watchMessages(String organizationId);
  Future<void> send({
    required String organizationId,
    required String senderId,
    required String senderName,
    required String text,
  });
  Future<void> purgeExpired(String organizationId);
}
