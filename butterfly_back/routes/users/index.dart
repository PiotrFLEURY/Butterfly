import 'package:butterfly_models/butterfly_models.dart';
import 'package:dart_frog/dart_frog.dart';

Response onRequest(RequestContext context) {
  final chats = context.read<List<ChatGroup>>();
  final users = chats
      .expand((chat) => chat.conversations)
      .expand((conversation) => conversation.participants)
      .toList();
  return Response.json(body: users);
}
