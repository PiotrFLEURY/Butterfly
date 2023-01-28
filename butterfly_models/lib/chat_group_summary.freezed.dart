// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_group_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatGroupSummary _$ChatGroupSummaryFromJson(Map<String, dynamic> json) {
  return _ChatGroupSummary.fromJson(json);
}

/// @nodoc
mixin _$ChatGroupSummary {
  String get name => throw _privateConstructorUsedError;
  int get conversationsCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatGroupSummaryCopyWith<ChatGroupSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatGroupSummaryCopyWith<$Res> {
  factory $ChatGroupSummaryCopyWith(
          ChatGroupSummary value, $Res Function(ChatGroupSummary) then) =
      _$ChatGroupSummaryCopyWithImpl<$Res, ChatGroupSummary>;
  @useResult
  $Res call({String name, int conversationsCount});
}

/// @nodoc
class _$ChatGroupSummaryCopyWithImpl<$Res, $Val extends ChatGroupSummary>
    implements $ChatGroupSummaryCopyWith<$Res> {
  _$ChatGroupSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? conversationsCount = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      conversationsCount: null == conversationsCount
          ? _value.conversationsCount
          : conversationsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChatGroupSummaryCopyWith<$Res>
    implements $ChatGroupSummaryCopyWith<$Res> {
  factory _$$_ChatGroupSummaryCopyWith(
          _$_ChatGroupSummary value, $Res Function(_$_ChatGroupSummary) then) =
      __$$_ChatGroupSummaryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int conversationsCount});
}

/// @nodoc
class __$$_ChatGroupSummaryCopyWithImpl<$Res>
    extends _$ChatGroupSummaryCopyWithImpl<$Res, _$_ChatGroupSummary>
    implements _$$_ChatGroupSummaryCopyWith<$Res> {
  __$$_ChatGroupSummaryCopyWithImpl(
      _$_ChatGroupSummary _value, $Res Function(_$_ChatGroupSummary) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? conversationsCount = null,
  }) {
    return _then(_$_ChatGroupSummary(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      conversationsCount: null == conversationsCount
          ? _value.conversationsCount
          : conversationsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatGroupSummary implements _ChatGroupSummary {
  const _$_ChatGroupSummary(
      {required this.name, required this.conversationsCount});

  factory _$_ChatGroupSummary.fromJson(Map<String, dynamic> json) =>
      _$$_ChatGroupSummaryFromJson(json);

  @override
  final String name;
  @override
  final int conversationsCount;

  @override
  String toString() {
    return 'ChatGroupSummary(name: $name, conversationsCount: $conversationsCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatGroupSummary &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.conversationsCount, conversationsCount) ||
                other.conversationsCount == conversationsCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, conversationsCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatGroupSummaryCopyWith<_$_ChatGroupSummary> get copyWith =>
      __$$_ChatGroupSummaryCopyWithImpl<_$_ChatGroupSummary>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatGroupSummaryToJson(
      this,
    );
  }
}

abstract class _ChatGroupSummary implements ChatGroupSummary {
  const factory _ChatGroupSummary(
      {required final String name,
      required final int conversationsCount}) = _$_ChatGroupSummary;

  factory _ChatGroupSummary.fromJson(Map<String, dynamic> json) =
      _$_ChatGroupSummary.fromJson;

  @override
  String get name;
  @override
  int get conversationsCount;
  @override
  @JsonKey(ignore: true)
  _$$_ChatGroupSummaryCopyWith<_$_ChatGroupSummary> get copyWith =>
      throw _privateConstructorUsedError;
}
