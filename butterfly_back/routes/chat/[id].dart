import 'dart:convert';

import 'package:butterfly_models/butterfly_models.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';

import 'index.dart';

Future<Response> onRequest(RequestContext context, String id) async {
  final handler = webSocketHandler(
    (channel, protocol) {
      // A new client has connected to our server.

      // Send a message to the client.
      channel.sink.add('hello from the server');

      // Listen for messages from the client.
      channel.stream.listen(
        (event) {
          // The client has sent a message.
          final message = event as String;
          messages.putIfAbsent(id, () => []);
          messages[id]?.add(
            Message.fromJson(jsonDecode(message) as Map<String, dynamic>),
          );
          channel.sink.add('Chat($id) - $message');
        },
        // The client has disconnected.
        onDone: () {
          // Remove the client from the list of connected clients.
          channel.sink.close();
        },
      );
    },
  );

  return handler(context);
}
