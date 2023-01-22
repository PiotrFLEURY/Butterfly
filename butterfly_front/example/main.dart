import 'dart:convert';

import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:butterfly_models/butterfly_models.dart';

void main() async {
  chatWithUser('John Doe', '1', 10, 1);
  chatWithUser('Jane', '1', 6, 2);
  chatWithUser('Stephane', '2', 3, 4);
  chatWithUser('John Doe', '2', 5, 3);

  await Future.delayed(Duration(seconds: 15));
}

Future<void> chatWithUser(
  String userName,
  String id,
  int count,
  int delay,
) async {
// Connect to the remote WebSocket endpoint.
  final uri = Uri.parse('ws://localhost:8080/chat/$id');
  final channel = WebSocketChannel.connect(uri);

  // Listen to messages from the server.
  channel.stream.listen(print);

  for (int i = 0; i < count; i++) {
    // wait a second
    await Future.delayed(Duration(seconds: delay));
    // Send a message to the server.

    channel.sink.add(
      jsonEncode(
        Message(
          date: DateTime.now(),
          senderId: userName,
          text: '$userName: message $i',
        ).toJson(),
      ),
    );
  }

  // Close the connection.
  channel.sink.close();
}
