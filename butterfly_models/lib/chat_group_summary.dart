import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_group_summary.g.dart';
part 'chat_group_summary.freezed.dart';

@freezed
class ChatGroupSummary with _$ChatGroupSummary {
  const factory ChatGroupSummary({
    required String name,
    required int conversationsCount,
  }) = _ChatGroupSummary;

  factory ChatGroupSummary.fromJson(Map<String, dynamic> json) =>
      _$ChatGroupSummaryFromJson(json);
}
