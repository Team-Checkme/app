// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checknote_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChecknoteEntity _$ChecknoteEntityFromJson(Map<String, dynamic> json) {
  return _ChecknoteEntity.fromJson(json);
}

/// @nodoc
mixin _$ChecknoteEntity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<String> get imageUrls => throw _privateConstructorUsedError;
  ChecknoteType get type => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this ChecknoteEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChecknoteEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChecknoteEntityCopyWith<ChecknoteEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChecknoteEntityCopyWith<$Res> {
  factory $ChecknoteEntityCopyWith(
          ChecknoteEntity value, $Res Function(ChecknoteEntity) then) =
      _$ChecknoteEntityCopyWithImpl<$Res, ChecknoteEntity>;
  @useResult
  $Res call(
      {String id,
      String name,
      List<String> imageUrls,
      ChecknoteType type,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$ChecknoteEntityCopyWithImpl<$Res, $Val extends ChecknoteEntity>
    implements $ChecknoteEntityCopyWith<$Res> {
  _$ChecknoteEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChecknoteEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUrls = null,
    Object? type = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrls: null == imageUrls
          ? _value.imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ChecknoteType,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChecknoteEntityImplCopyWith<$Res>
    implements $ChecknoteEntityCopyWith<$Res> {
  factory _$$ChecknoteEntityImplCopyWith(_$ChecknoteEntityImpl value,
          $Res Function(_$ChecknoteEntityImpl) then) =
      __$$ChecknoteEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      List<String> imageUrls,
      ChecknoteType type,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$ChecknoteEntityImplCopyWithImpl<$Res>
    extends _$ChecknoteEntityCopyWithImpl<$Res, _$ChecknoteEntityImpl>
    implements _$$ChecknoteEntityImplCopyWith<$Res> {
  __$$ChecknoteEntityImplCopyWithImpl(
      _$ChecknoteEntityImpl _value, $Res Function(_$ChecknoteEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChecknoteEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUrls = null,
    Object? type = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$ChecknoteEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrls: null == imageUrls
          ? _value._imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ChecknoteType,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChecknoteEntityImpl implements _ChecknoteEntity {
  const _$ChecknoteEntityImpl(
      {required this.id,
      required this.name,
      required final List<String> imageUrls,
      required this.type,
      required this.createdAt,
      required this.updatedAt})
      : _imageUrls = imageUrls;

  factory _$ChecknoteEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChecknoteEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  final List<String> _imageUrls;
  @override
  List<String> get imageUrls {
    if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageUrls);
  }

  @override
  final ChecknoteType type;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'ChecknoteEntity(id: $id, name: $name, imageUrls: $imageUrls, type: $type, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChecknoteEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._imageUrls, _imageUrls) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      const DeepCollectionEquality().hash(_imageUrls),
      type,
      createdAt,
      updatedAt);

  /// Create a copy of ChecknoteEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChecknoteEntityImplCopyWith<_$ChecknoteEntityImpl> get copyWith =>
      __$$ChecknoteEntityImplCopyWithImpl<_$ChecknoteEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChecknoteEntityImplToJson(
      this,
    );
  }
}

abstract class _ChecknoteEntity implements ChecknoteEntity {
  const factory _ChecknoteEntity(
      {required final String id,
      required final String name,
      required final List<String> imageUrls,
      required final ChecknoteType type,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$ChecknoteEntityImpl;

  factory _ChecknoteEntity.fromJson(Map<String, dynamic> json) =
      _$ChecknoteEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  List<String> get imageUrls;
  @override
  ChecknoteType get type;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of ChecknoteEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChecknoteEntityImplCopyWith<_$ChecknoteEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
