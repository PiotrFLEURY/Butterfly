import 'package:butterfly_models/butterfly_models.dart';

// ignore: prefer_single_quotes
ChatGroup aChatGroup({
  String named = 'Dart Frog',
}) =>
    ChatGroup(
      name: named,
      conversations: [
        Conversation(
          id: '1',
          participants: [
            const User(
              id: '1',
              name: 'Dart Frog',
              profilePicture: 'https://example.com/dart_frog.jpg',
            ),
          ],
          messages: [
            Message(
              date: DateTime.now(),
              senderId: 'Dart Frog',
              text: 'Hello World!',
            ),
          ],
        ),
      ],
    );
