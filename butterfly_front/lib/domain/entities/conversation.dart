import 'package:butterfly_front/domain/entities/entities.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversation.freezed.dart';

@freezed
class Conversation with _$Conversation {
  const factory Conversation({
    required String id,
    required List<User> participants,
    required List<Message> messages,
  }) = _Conversation;
}
