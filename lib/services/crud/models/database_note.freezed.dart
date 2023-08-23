// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'database_note.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DatabaseNote {
  int get id => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  bool get isSyncedWithCloud => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DatabaseNoteCopyWith<DatabaseNote> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DatabaseNoteCopyWith<$Res> {
  factory $DatabaseNoteCopyWith(
          DatabaseNote value, $Res Function(DatabaseNote) then) =
      _$DatabaseNoteCopyWithImpl<$Res, DatabaseNote>;
  @useResult
  $Res call({int id, int userId, String text, bool isSyncedWithCloud});
}

/// @nodoc
class _$DatabaseNoteCopyWithImpl<$Res, $Val extends DatabaseNote>
    implements $DatabaseNoteCopyWith<$Res> {
  _$DatabaseNoteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? text = null,
    Object? isSyncedWithCloud = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      isSyncedWithCloud: null == isSyncedWithCloud
          ? _value.isSyncedWithCloud
          : isSyncedWithCloud // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DatabaseNoteCopyWith<$Res>
    implements $DatabaseNoteCopyWith<$Res> {
  factory _$$_DatabaseNoteCopyWith(
          _$_DatabaseNote value, $Res Function(_$_DatabaseNote) then) =
      __$$_DatabaseNoteCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, int userId, String text, bool isSyncedWithCloud});
}

/// @nodoc
class __$$_DatabaseNoteCopyWithImpl<$Res>
    extends _$DatabaseNoteCopyWithImpl<$Res, _$_DatabaseNote>
    implements _$$_DatabaseNoteCopyWith<$Res> {
  __$$_DatabaseNoteCopyWithImpl(
      _$_DatabaseNote _value, $Res Function(_$_DatabaseNote) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? text = null,
    Object? isSyncedWithCloud = null,
  }) {
    return _then(_$_DatabaseNote(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      isSyncedWithCloud: null == isSyncedWithCloud
          ? _value.isSyncedWithCloud
          : isSyncedWithCloud // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_DatabaseNote implements _DatabaseNote {
  const _$_DatabaseNote(
      {required this.id,
      required this.userId,
      required this.text,
      required this.isSyncedWithCloud});

  @override
  final int id;
  @override
  final int userId;
  @override
  final String text;
  @override
  final bool isSyncedWithCloud;

  @override
  String toString() {
    return 'DatabaseNote(id: $id, userId: $userId, text: $text, isSyncedWithCloud: $isSyncedWithCloud)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DatabaseNote &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.isSyncedWithCloud, isSyncedWithCloud) ||
                other.isSyncedWithCloud == isSyncedWithCloud));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, userId, text, isSyncedWithCloud);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DatabaseNoteCopyWith<_$_DatabaseNote> get copyWith =>
      __$$_DatabaseNoteCopyWithImpl<_$_DatabaseNote>(this, _$identity);
}

abstract class _DatabaseNote implements DatabaseNote {
  const factory _DatabaseNote(
      {required final int id,
      required final int userId,
      required final String text,
      required final bool isSyncedWithCloud}) = _$_DatabaseNote;

  @override
  int get id;
  @override
  int get userId;
  @override
  String get text;
  @override
  bool get isSyncedWithCloud;
  @override
  @JsonKey(ignore: true)
  _$$_DatabaseNoteCopyWith<_$_DatabaseNote> get copyWith =>
      throw _privateConstructorUsedError;
}
