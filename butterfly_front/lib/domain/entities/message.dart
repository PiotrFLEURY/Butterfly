import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';

@freezed
class Message with _$Message {
  const factory Message({
    required String text,
    required DateTime date,
    required String senderId,
  }) = _Message;
}
