import 'package:butterfly_models/butterfly_models.dart';
import 'package:collection/collection.dart';
import 'package:dart_frog/dart_frog.dart';

import 'index.dart';

Response onRequest(RequestContext context, String name) {
  final chats = context.read<List<ChatGroup>>();

  final chat = chats.firstWhereOrNull((chat) => chat.name == name);

  if (chat == null) {
    return Response(
      statusCode: 404,
      body: 'Chat not found',
    );
  }

  return Response.json(
    body: toSummary(
      chat,
    ),
  );
}
