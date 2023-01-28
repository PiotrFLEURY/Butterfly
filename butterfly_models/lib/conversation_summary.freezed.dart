// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversation_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ConversationSummary _$ConversationSummaryFromJson(Map<String, dynamic> json) {
  return _ConversationSummary.fromJson(json);
}

/// @nodoc
mixin _$ConversationSummary {
  String get id => throw _privateConstructorUsedError;
  String get latestMessage => throw _privateConstructorUsedError;
  List<String> get participants => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConversationSummaryCopyWith<ConversationSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversationSummaryCopyWith<$Res> {
  factory $ConversationSummaryCopyWith(
          ConversationSummary value, $Res Function(ConversationSummary) then) =
      _$ConversationSummaryCopyWithImpl<$Res, ConversationSummary>;
  @useResult
  $Res call({String id, String latestMessage, List<String> participants});
}

/// @nodoc
class _$ConversationSummaryCopyWithImpl<$Res, $Val extends ConversationSummary>
    implements $ConversationSummaryCopyWith<$Res> {
  _$ConversationSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? latestMessage = null,
    Object? participants = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      latestMessage: null == latestMessage
          ? _value.latestMessage
          : latestMessage // ignore: cast_nullable_to_non_nullable
              as String,
      participants: null == participants
          ? _value.participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ConversationSummaryCopyWith<$Res>
    implements $ConversationSummaryCopyWith<$Res> {
  factory _$$_ConversationSummaryCopyWith(_$_ConversationSummary value,
          $Res Function(_$_ConversationSummary) then) =
      __$$_ConversationSummaryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String latestMessage, List<String> participants});
}

/// @nodoc
class __$$_ConversationSummaryCopyWithImpl<$Res>
    extends _$ConversationSummaryCopyWithImpl<$Res, _$_ConversationSummary>
    implements _$$_ConversationSummaryCopyWith<$Res> {
  __$$_ConversationSummaryCopyWithImpl(_$_ConversationSummary _value,
      $Res Function(_$_ConversationSummary) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? latestMessage = null,
    Object? participants = null,
  }) {
    return _then(_$_ConversationSummary(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      latestMessage: null == latestMessage
          ? _value.latestMessage
          : latestMessage // ignore: cast_nullable_to_non_nullable
              as String,
      participants: null == participants
          ? _value._participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ConversationSummary implements _ConversationSummary {
  const _$_ConversationSummary(
      {required this.id,
      required this.latestMessage,
      required final List<String> participants})
      : _participants = participants;

  factory _$_ConversationSummary.fromJson(Map<String, dynamic> json) =>
      _$$_ConversationSummaryFromJson(json);

  @override
  final String id;
  @override
  final String latestMessage;
  final List<String> _participants;
  @override
  List<String> get participants {
    if (_participants is EqualUnmodifiableListView) return _participants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_participants);
  }

  @override
  String toString() {
    return 'ConversationSummary(id: $id, latestMessage: $latestMessage, participants: $participants)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConversationSummary &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.latestMessage, latestMessage) ||
                other.latestMessage == latestMessage) &&
            const DeepCollectionEquality()
                .equals(other._participants, _participants));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, latestMessage,
      const DeepCollectionEquality().hash(_participants));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConversationSummaryCopyWith<_$_ConversationSummary> get copyWith =>
      __$$_ConversationSummaryCopyWithImpl<_$_ConversationSummary>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ConversationSummaryToJson(
      this,
    );
  }
}

abstract class _ConversationSummary implements ConversationSummary {
  const factory _ConversationSummary(
      {required final String id,
      required final String latestMessage,
      required final List<String> participants}) = _$_ConversationSummary;

  factory _ConversationSummary.fromJson(Map<String, dynamic> json) =
      _$_ConversationSummary.fromJson;

  @override
  String get id;
  @override
  String get latestMessage;
  @override
  List<String> get participants;
  @override
  @JsonKey(ignore: true)
  _$$_ConversationSummaryCopyWith<_$_ConversationSummary> get copyWith =>
      throw _privateConstructorUsedError;
}
