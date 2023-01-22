import 'package:butterfly_front/domain/entities/entities.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_group.freezed.dart';

@freezed
class ChatGroup with _$ChatGroup {
  const factory ChatGroup({
    required String name,
    required List<Conversation> conversations,
  }) = _ChatGroup;
}
