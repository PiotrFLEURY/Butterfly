import 'package:butterfly_front/domain/entities/entities.dart';

mixin ChatRepository {
  List<ChatGroup> getChats();
  Conversation? getConversation(String id);
  Conversation sendMessage(
    Conversation conversation,
    String message,
    String senderId,
  );
}
