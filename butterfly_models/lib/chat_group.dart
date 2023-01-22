// ignore_for_file: invalid_annotation_target

import 'package:butterfly_models/butterfly_models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_group.freezed.dart';

part 'chat_group.g.dart';

@freezed
class ChatGroup with _$ChatGroup {
  @JsonSerializable(explicitToJson: true)
  const factory ChatGroup({
    required String name,
    required List<Conversation> conversations,
  }) = _ChatGroup;

  factory ChatGroup.fromJson(Map<String, dynamic> json) =>
      _$ChatGroupFromJson(json);
}
