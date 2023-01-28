import 'package:butterfly_models/butterfly_models.dart';

mixin ChatRepository {
  List<ChatGroup> getChats();
  Conversation? getConversation(String id);
  Conversation sendMessage(
    Conversation conversation,
    String message,
    String senderId,
  );
}
