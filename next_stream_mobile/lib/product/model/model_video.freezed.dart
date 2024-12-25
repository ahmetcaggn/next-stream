// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'model_video.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ModelVideo {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get filePath => throw _privateConstructorUsedError;
  DateTime get creationDate => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;

  /// Create a copy of ModelVideo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ModelVideoCopyWith<ModelVideo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModelVideoCopyWith<$Res> {
  factory $ModelVideoCopyWith(
          ModelVideo value, $Res Function(ModelVideo) then) =
      _$ModelVideoCopyWithImpl<$Res, ModelVideo>;
  @useResult
  $Res call(
      {int id,
      String title,
      String description,
      String filePath,
      DateTime creationDate,
      int userId});
}

/// @nodoc
class _$ModelVideoCopyWithImpl<$Res, $Val extends ModelVideo>
    implements $ModelVideoCopyWith<$Res> {
  _$ModelVideoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ModelVideo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? filePath = null,
    Object? creationDate = null,
    Object? userId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      filePath: null == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ModelVideoImplCopyWith<$Res>
    implements $ModelVideoCopyWith<$Res> {
  factory _$$ModelVideoImplCopyWith(
          _$ModelVideoImpl value, $Res Function(_$ModelVideoImpl) then) =
      __$$ModelVideoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String description,
      String filePath,
      DateTime creationDate,
      int userId});
}

/// @nodoc
class __$$ModelVideoImplCopyWithImpl<$Res>
    extends _$ModelVideoCopyWithImpl<$Res, _$ModelVideoImpl>
    implements _$$ModelVideoImplCopyWith<$Res> {
  __$$ModelVideoImplCopyWithImpl(
      _$ModelVideoImpl _value, $Res Function(_$ModelVideoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ModelVideo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? filePath = null,
    Object? creationDate = null,
    Object? userId = null,
  }) {
    return _then(_$ModelVideoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      filePath: null == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ModelVideoImpl implements _ModelVideo {
  const _$ModelVideoImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.filePath,
      required this.creationDate,
      required this.userId});

  @override
  final int id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String filePath;
  @override
  final DateTime creationDate;
  @override
  final int userId;

  @override
  String toString() {
    return 'ModelVideo(id: $id, title: $title, description: $description, filePath: $filePath, creationDate: $creationDate, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModelVideoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath) &&
            (identical(other.creationDate, creationDate) ||
                other.creationDate == creationDate) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, description, filePath, creationDate, userId);

  /// Create a copy of ModelVideo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ModelVideoImplCopyWith<_$ModelVideoImpl> get copyWith =>
      __$$ModelVideoImplCopyWithImpl<_$ModelVideoImpl>(this, _$identity);
}

abstract class _ModelVideo implements ModelVideo {
  const factory _ModelVideo(
      {required final int id,
      required final String title,
      required final String description,
      required final String filePath,
      required final DateTime creationDate,
      required final int userId}) = _$ModelVideoImpl;

  @override
  int get id;
  @override
  String get title;
  @override
  String get description;
  @override
  String get filePath;
  @override
  DateTime get creationDate;
  @override
  int get userId;

  /// Create a copy of ModelVideo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ModelVideoImplCopyWith<_$ModelVideoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
