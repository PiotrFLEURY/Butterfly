// ignore_for_file: avoid_escaping_inner_quotes

import 'package:butterfly_models/butterfly_models.dart';
import 'package:dart_frog/dart_frog.dart';

final chats = [
  ChatGroup(
    name: 'Favourites',
    conversations: [
      Conversation(
        id: '1',
        participants: [
          const User(
            id: 'bob@example.com',
            name: 'Bob',
            profilePicture: 'https://picsum.photos/200?random=1',
          ),
          const User(
            id: 'alice@example.com',
            name: 'Alice',
            profilePicture: 'https://picsum.photos/200?random=2',
          ),
        ],
        messages: [
          Message(
            text: 'How are you ?',
            date: DateTime.now(),
            senderId: 'connected_user@example.com',
          ),
          Message(
            text: 'I\'m fine, and you ?',
            date: DateTime.now(),
            senderId: 'alice@example.com',
          ),
        ],
      ),
      Conversation(
        id: '2',
        participants: [
          const User(
            id: 'john@example.com',
            name: 'John',
            profilePicture: 'https://picsum.photos/200?random=3',
          ),
          const User(
            id: 'jane@example.com',
            name: 'Jane',
            profilePicture: 'https://picsum.photos/200?random=4',
          ),
        ],
        messages: [
          Message(
            text: "What's up ?",
            date: DateTime.now(),
            senderId: 'connected_user@example.com',
          ),
          Message(
            text: 'Nothing much, just chilling',
            date: DateTime.now(),
            senderId: 'jane@example.com',
          ),
          Message(
            text: 'Cool, see you later',
            date: DateTime.now(),
            senderId: 'connected_user@example.com',
          ),
          Message(
            text: 'Bye',
            date: DateTime.now(),
            senderId: 'jane@example.com',
          ),
        ],
      ),
    ],
  ),
  ChatGroup(
    name: 'Work',
    conversations: [
      Conversation(
        id: '3',
        participants: [
          const User(
            id: '5',
            name: 'Robert',
            profilePicture: 'https://picsum.photos/200?random=5',
          ),
          const User(
            id: '6',
            name: 'Megane',
            profilePicture: 'https://picsum.photos/200?random=6',
          ),
        ],
        messages: [
          Message(
            text: 'Did you fnish the project ?',
            date: DateTime.now(),
            senderId: 'connected_user@example.com',
          ),
          Message(
            text: 'Yes, I did',
            date: DateTime.now(),
            senderId: '6',
          ),
        ],
      ),
      Conversation(
        id: '4',
        participants: [
          const User(
            id: '7',
            name: 'Marie',
            profilePicture: 'https://picsum.photos/200?random=7',
          ),
          const User(
            id: '8',
            name: 'Paul',
            profilePicture: 'https://picsum.photos/200?random=8',
          ),
        ],
        messages: [
          Message(
            text: 'Where is the documentation ?',
            date: DateTime.now(),
            senderId: 'connected_user@example.com',
          ),
          Message(
            text: "I'm working on it",
            date: DateTime.now(),
            senderId: '8',
          ),
          Message(
            text: "Ok, I'll wait",
            date: DateTime.now(),
            senderId: 'connected_user@example.com',
          ),
          Message(
            text: 'Here it is',
            date: DateTime.now(),
            senderId: '8',
          ),
        ],
      ),
    ],
  ),
];

Handler middleware(Handler handler) {
  return handler
      .use(requestLogger())
      .use(provider<List<ChatGroup>>((_) => chats));
}
