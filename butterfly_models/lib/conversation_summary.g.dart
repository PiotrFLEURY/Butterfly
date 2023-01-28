// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ConversationSummary _$$_ConversationSummaryFromJson(
        Map<String, dynamic> json) =>
    _$_ConversationSummary(
      id: json['id'] as String,
      latestMessage: json['latestMessage'] as String,
      participants: (json['participants'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_ConversationSummaryToJson(
        _$_ConversationSummary instance) =>
    <String, dynamic>{
      'id': instance.id,
      'latestMessage': instance.latestMessage,
      'participants': instance.participants,
    };
