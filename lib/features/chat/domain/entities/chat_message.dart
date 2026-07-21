import 'package:equatable/equatable.dart';

class ChatMessage extends Equatable {
  const ChatMessage({
    required this.id,
    required this.organizationId,
    required this.senderId,
    required this.senderName,
    required this.text,
    required this.createdAt,
    required this.expiresAt,
  });
  final String id, organizationId, senderId, senderName, text;
  final DateTime createdAt, expiresAt;
  bool get expired => !expiresAt.isAfter(DateTime.now());
  @override
  List<Object> get props => [
    id,
    organizationId,
    senderId,
    senderName,
    text,
    createdAt,
    expiresAt,
  ];
}
