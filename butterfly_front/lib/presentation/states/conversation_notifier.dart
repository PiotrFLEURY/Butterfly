import 'package:butterfly_models/butterfly_models.dart';
import 'package:butterfly_front/domain/usecases/fetch_conversation.dart';
import 'package:butterfly_front/domain/usecases/send_message.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConversationNotifier extends StateNotifier<Conversation?> {
  ConversationNotifier(
    this._fetchConversation,
    this._sendMessage,
  ) : super(null);

  final FetchConversation _fetchConversation;
  final SendMessage _sendMessage;

  void fetchConversation(String id) => state = _fetchConversation(id);

  void sendMessage(String text) {
    state = _sendMessage(state!, text, 'connected_user@example.com');
  }
}
