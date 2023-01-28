import 'package:butterfly_models/butterfly_models.dart';
import 'package:collection/collection.dart';
import 'package:dart_frog/dart_frog.dart';

Response onRequest(RequestContext context) {
  final chats = context.read<List<ChatGroup>>();

  // Access the query parameters as a `Map<String, String>`.
  final params = context.request.uri.queryParameters;

  final chatGroupName = params['chatGroup'];

  final conversations = chats
      .firstWhereOrNull((chat) => chat.name == chatGroupName)
      ?.conversations
      .map(toSummary)
      .toList();

  if (conversations == null) {
    return Response(
      statusCode: 404,
      body: 'Chat not found',
    );
  }

  return Response.json(body: conversations);
}

ConversationSummary toSummary(Conversation conversation) => ConversationSummary(
      id: conversation.id,
      latestMessage: conversation.messages.last.text,
      participants: conversation.participants.map((user) => user.name).toList(),
    );
