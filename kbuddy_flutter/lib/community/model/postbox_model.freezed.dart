// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'postbox_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PostBox _$PostBoxFromJson(Map<String, dynamic> json) {
  return _PostBox.fromJson(json);
}

/// @nodoc
mixin _$PostBox {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostBoxCopyWith<PostBox> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostBoxCopyWith<$Res> {
  factory $PostBoxCopyWith(PostBox value, $Res Function(PostBox) then) =
      _$PostBoxCopyWithImpl<$Res, PostBox>;
  @useResult
  $Res call({String id, String title, String content});
}

/// @nodoc
class _$PostBoxCopyWithImpl<$Res, $Val extends PostBox>
    implements $PostBoxCopyWith<$Res> {
  _$PostBoxCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostBoxImplCopyWith<$Res> implements $PostBoxCopyWith<$Res> {
  factory _$$PostBoxImplCopyWith(
          _$PostBoxImpl value, $Res Function(_$PostBoxImpl) then) =
      __$$PostBoxImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String title, String content});
}

/// @nodoc
class __$$PostBoxImplCopyWithImpl<$Res>
    extends _$PostBoxCopyWithImpl<$Res, _$PostBoxImpl>
    implements _$$PostBoxImplCopyWith<$Res> {
  __$$PostBoxImplCopyWithImpl(
      _$PostBoxImpl _value, $Res Function(_$PostBoxImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
  }) {
    return _then(_$PostBoxImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostBoxImpl implements _PostBox {
  _$PostBoxImpl({required this.id, required this.title, required this.content});

  factory _$PostBoxImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostBoxImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String content;

  @override
  String toString() {
    return 'PostBox(id: $id, title: $title, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostBoxImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostBoxImplCopyWith<_$PostBoxImpl> get copyWith =>
      __$$PostBoxImplCopyWithImpl<_$PostBoxImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostBoxImplToJson(
      this,
    );
  }
}

abstract class _PostBox implements PostBox {
  factory _PostBox(
      {required final String id,
      required final String title,
      required final String content}) = _$PostBoxImpl;

  factory _PostBox.fromJson(Map<String, dynamic> json) = _$PostBoxImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get content;
  @override
  @JsonKey(ignore: true)
  _$$PostBoxImplCopyWith<_$PostBoxImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
