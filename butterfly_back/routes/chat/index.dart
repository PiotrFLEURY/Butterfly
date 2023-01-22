import 'dart:convert';

import 'package:butterfly_models/butterfly_models.dart';
import 'package:dart_frog/dart_frog.dart';

final Map<String, List<Message>> messages = {};

Response onRequest(RequestContext context) {
  final id = context.request.uri.queryParameters['id'];

  final foundMessages = id != null ? messages[id] ?? [] : messages;

  return Response.json(body: jsonEncode(foundMessages));
}
