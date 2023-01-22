// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatGroup _$$_ChatGroupFromJson(Map<String, dynamic> json) => _$_ChatGroup(
      name: json['name'] as String,
      conversations: (json['conversations'] as List<dynamic>)
          .map((e) => Conversation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ChatGroupToJson(_$_ChatGroup instance) =>
    <String, dynamic>{
      'name': instance.name,
      'conversations': instance.conversations.map((e) => e.toJson()).toList(),
    };
