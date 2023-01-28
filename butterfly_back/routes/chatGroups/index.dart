import 'package:butterfly_models/butterfly_models.dart';
import 'package:dart_frog/dart_frog.dart';

// /chatGroups
Response onRequest(RequestContext context) {
  final chats = context.read<List<ChatGroup>>();

  final chatGroupSummary = chats.map(toSummary).toList();

  return Response.json(
    body: chatGroupSummary,
  );
}

ChatGroupSummary toSummary(ChatGroup chat) => ChatGroupSummary(
      name: chat.name,
      conversationsCount: chat.conversations.length,
    );
