import 'package:butterfly_models/butterfly_models.dart';
import 'package:collection/collection.dart';
import 'package:dart_frog/dart_frog.dart';

import 'index.dart';

Response onRequest(RequestContext context, String id) {
  final chats = context.read<List<ChatGroup>>();

  // Access the query parameters as a `Map<String, String>`.
  final params = context.request.uri.queryParameters;

  final chatGroupName = params['chatGroup'];

  final conversation = chats
      .firstWhereOrNull((chat) => chat.name == chatGroupName)
      ?.conversations
      .firstWhereOrNull((conversation) => conversation.id == id);

  if (conversation == null) {
    return Response(
      statusCode: 404,
      body: 'Conversation not found',
    );
  }

  return Response.json(body: toSummary(conversation));
}
