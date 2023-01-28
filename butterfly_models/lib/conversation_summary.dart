import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversation_summary.freezed.dart';
part 'conversation_summary.g.dart';

@freezed
class ConversationSummary with _$ConversationSummary {
  const factory ConversationSummary({
    required String id,
    required String latestMessage,
    required List<String> participants,
  }) = _ConversationSummary;

  factory ConversationSummary.fromJson(Map<String, dynamic> json) =>
      _$ConversationSummaryFromJson(json);
}
