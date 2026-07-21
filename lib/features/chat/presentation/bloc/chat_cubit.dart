import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/chat_message.dart';
import '../../domain/repositories/chat_repository.dart';

class ChatState extends Equatable {
  const ChatState({this.messages = const [], this.sending = false, this.error});
  final List<ChatMessage> messages;
  final bool sending;
  final String? error;
  @override
  List<Object?> get props => [messages, sending, error];
}

class ChatCubit extends Cubit<ChatState> {
  ChatCubit(this._repository) : super(const ChatState());
  final ChatRepository _repository;
  StreamSubscription<List<ChatMessage>>? _subscription;
  Timer? _expiryTimer;
  String? organizationId;

  Future<void> start(String scope) async {
    if (organizationId == scope && _subscription != null) return;
    organizationId = scope;
    await _subscription?.cancel();
    _subscription = _repository
        .watchMessages(scope)
        .listen((messages) => emit(ChatState(messages: _visible(messages))));
    _expiryTimer ??= Timer.periodic(const Duration(minutes: 1), (_) {
      if (!isClosed) emit(ChatState(messages: _visible(state.messages)));
      final scope = organizationId;
      if (scope != null) unawaited(_repository.purgeExpired(scope));
    });
  }

  Future<void> send({
    required String senderId,
    required String senderName,
    required String text,
  }) async {
    final scope = organizationId;
    if (scope == null || text.trim().isEmpty) return;
    emit(ChatState(messages: state.messages, sending: true));
    try {
      await _repository.send(
        organizationId: scope,
        senderId: senderId,
        senderName: senderName,
        text: text,
      );
      emit(ChatState(messages: state.messages));
    } catch (error) {
      emit(ChatState(messages: state.messages, error: error.toString()));
    }
  }

  List<ChatMessage> _visible(List<ChatMessage> values) =>
      values.where((message) => !message.expired).toList()
        ..sort((a, b) => a.createdAt.compareTo(b.createdAt));
  @override
  Future<void> close() async {
    _expiryTimer?.cancel();
    await _subscription?.cancel();
    return super.close();
  }
}
