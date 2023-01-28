import 'package:butterfly_models/butterfly_models.dart';
import 'package:butterfly_front/domain/repositories/chat_repository.dart';

class SendMessage {
  SendMessage(this._repository);

  final ChatRepository _repository;

  Conversation call(
    Conversation conversation,
    String message,
    String sendId,
  ) {
    return _repository.sendMessage(
      conversation,
      message,
      sendId,
    );
  }
}
