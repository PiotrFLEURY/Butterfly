import 'dart:convert';

import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';
import 'package:butterfly_models/butterfly_models.dart';

import '../index.dart';
import 'index.dart';

Future<Response> onRequest(RequestContext context, String id) async {
  final handler = webSocketHandler(
    (channel, protocol) {
      // A new client has connected to our server.
      log('connected to chat $id');

      // Send a message to the client.
      channel.sink.add('hello from the server');

      // Listen for messages from the client.
      channel.stream.listen(
        (event) {
          // The client has sent a message.
          log('received: $event');
          final message = event as String;
          messages.putIfAbsent(id, () => []);
          messages[id]?.add(
            Message.fromJson(jsonDecode(message) as Map<String, dynamic>),
          );
          channel.sink.add('Chat($id) - $message');
        },
        // The client has disconnected.
        onDone: () => log('disconnected'),
      );
    },
  );

  return handler(context);
}
