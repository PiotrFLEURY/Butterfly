// ignore_for_file: invalid_annotation_target

import 'package:butterfly_models/butterfly_models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversation.freezed.dart';

part 'conversation.g.dart';

@freezed
class Conversation with _$Conversation {
  @JsonSerializable(explicitToJson: true)
  const factory Conversation({
    required String id,
    required List<User> participants,
    required List<Message> messages,
  }) = _Conversation;

  factory Conversation.fromJson(Map<String, dynamic> json) =>
      _$ConversationFromJson(json);
}
