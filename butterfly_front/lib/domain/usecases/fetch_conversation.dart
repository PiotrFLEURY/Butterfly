import 'package:butterfly_front/domain/entities/entities.dart';
import 'package:butterfly_front/domain/repositories/chat_repository.dart';

class FetchConversation {
  final ChatRepository repository;

  FetchConversation(this.repository);

  Conversation? call(String id) {
    return repository.getConversation(id);
  }
}
