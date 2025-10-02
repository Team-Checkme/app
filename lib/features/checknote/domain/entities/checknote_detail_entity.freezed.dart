// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checknote_detail_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChecknoteDetailEntity _$ChecknoteDetailEntityFromJson(
    Map<String, dynamic> json) {
  return _ChecknoteDetailEntity.fromJson(json);
}

/// @nodoc
mixin _$ChecknoteDetailEntity {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<String> get hashtags => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get imageUrls => throw _privateConstructorUsedError;
  ChecknoteType get type => throw _privateConstructorUsedError;
  ChecknoteStatus get status => throw _privateConstructorUsedError;
  ChecknoteMasterInfo get master => throw _privateConstructorUsedError;
  ChecknoteParticipantInfo get participants =>
      throw _privateConstructorUsedError;
  ChecknoteCheckInfo get checkInfo => throw _privateConstructorUsedError;
  List<ChecknoteCheckItem> get checkItems => throw _privateConstructorUsedError;
  ChecknoteAccordionInfo get accordionInfo =>
      throw _privateConstructorUsedError;
  ChecknoteTabInfo get tabInfo => throw _privateConstructorUsedError;
  ChecknoteStats get stats => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this ChecknoteDetailEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChecknoteDetailEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChecknoteDetailEntityCopyWith<ChecknoteDetailEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChecknoteDetailEntityCopyWith<$Res> {
  factory $ChecknoteDetailEntityCopyWith(ChecknoteDetailEntity value,
          $Res Function(ChecknoteDetailEntity) then) =
      _$ChecknoteDetailEntityCopyWithImpl<$Res, ChecknoteDetailEntity>;
  @useResult
  $Res call(
      {String id,
      String title,
      List<String> hashtags,
      String description,
      List<String> imageUrls,
      ChecknoteType type,
      ChecknoteStatus status,
      ChecknoteMasterInfo master,
      ChecknoteParticipantInfo participants,
      ChecknoteCheckInfo checkInfo,
      List<ChecknoteCheckItem> checkItems,
      ChecknoteAccordionInfo accordionInfo,
      ChecknoteTabInfo tabInfo,
      ChecknoteStats stats,
      DateTime createdAt,
      DateTime updatedAt});

  $ChecknoteMasterInfoCopyWith<$Res> get master;
  $ChecknoteParticipantInfoCopyWith<$Res> get participants;
  $ChecknoteCheckInfoCopyWith<$Res> get checkInfo;
  $ChecknoteAccordionInfoCopyWith<$Res> get accordionInfo;
  $ChecknoteTabInfoCopyWith<$Res> get tabInfo;
  $ChecknoteStatsCopyWith<$Res> get stats;
}

/// @nodoc
class _$ChecknoteDetailEntityCopyWithImpl<$Res,
        $Val extends ChecknoteDetailEntity>
    implements $ChecknoteDetailEntityCopyWith<$Res> {
  _$ChecknoteDetailEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChecknoteDetailEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? hashtags = null,
    Object? description = null,
    Object? imageUrls = null,
    Object? type = null,
    Object? status = null,
    Object? master = null,
    Object? participants = null,
    Object? checkInfo = null,
    Object? checkItems = null,
    Object? accordionInfo = null,
    Object? tabInfo = null,
    Object? stats = null,
    Object? createdAt = null,
    Object? updatedAt = null,
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
      hashtags: null == hashtags
          ? _value.hashtags
          : hashtags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrls: null == imageUrls
          ? _value.imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ChecknoteType,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ChecknoteStatus,
      master: null == master
          ? _value.master
          : master // ignore: cast_nullable_to_non_nullable
              as ChecknoteMasterInfo,
      participants: null == participants
          ? _value.participants
          : participants // ignore: cast_nullable_to_non_nullable
              as ChecknoteParticipantInfo,
      checkInfo: null == checkInfo
          ? _value.checkInfo
          : checkInfo // ignore: cast_nullable_to_non_nullable
              as ChecknoteCheckInfo,
      checkItems: null == checkItems
          ? _value.checkItems
          : checkItems // ignore: cast_nullable_to_non_nullable
              as List<ChecknoteCheckItem>,
      accordionInfo: null == accordionInfo
          ? _value.accordionInfo
          : accordionInfo // ignore: cast_nullable_to_non_nullable
              as ChecknoteAccordionInfo,
      tabInfo: null == tabInfo
          ? _value.tabInfo
          : tabInfo // ignore: cast_nullable_to_non_nullable
              as ChecknoteTabInfo,
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as ChecknoteStats,
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

  /// Create a copy of ChecknoteDetailEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChecknoteMasterInfoCopyWith<$Res> get master {
    return $ChecknoteMasterInfoCopyWith<$Res>(_value.master, (value) {
      return _then(_value.copyWith(master: value) as $Val);
    });
  }

  /// Create a copy of ChecknoteDetailEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChecknoteParticipantInfoCopyWith<$Res> get participants {
    return $ChecknoteParticipantInfoCopyWith<$Res>(_value.participants,
        (value) {
      return _then(_value.copyWith(participants: value) as $Val);
    });
  }

  /// Create a copy of ChecknoteDetailEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChecknoteCheckInfoCopyWith<$Res> get checkInfo {
    return $ChecknoteCheckInfoCopyWith<$Res>(_value.checkInfo, (value) {
      return _then(_value.copyWith(checkInfo: value) as $Val);
    });
  }

  /// Create a copy of ChecknoteDetailEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChecknoteAccordionInfoCopyWith<$Res> get accordionInfo {
    return $ChecknoteAccordionInfoCopyWith<$Res>(_value.accordionInfo, (value) {
      return _then(_value.copyWith(accordionInfo: value) as $Val);
    });
  }

  /// Create a copy of ChecknoteDetailEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChecknoteTabInfoCopyWith<$Res> get tabInfo {
    return $ChecknoteTabInfoCopyWith<$Res>(_value.tabInfo, (value) {
      return _then(_value.copyWith(tabInfo: value) as $Val);
    });
  }

  /// Create a copy of ChecknoteDetailEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChecknoteStatsCopyWith<$Res> get stats {
    return $ChecknoteStatsCopyWith<$Res>(_value.stats, (value) {
      return _then(_value.copyWith(stats: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChecknoteDetailEntityImplCopyWith<$Res>
    implements $ChecknoteDetailEntityCopyWith<$Res> {
  factory _$$ChecknoteDetailEntityImplCopyWith(
          _$ChecknoteDetailEntityImpl value,
          $Res Function(_$ChecknoteDetailEntityImpl) then) =
      __$$ChecknoteDetailEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      List<String> hashtags,
      String description,
      List<String> imageUrls,
      ChecknoteType type,
      ChecknoteStatus status,
      ChecknoteMasterInfo master,
      ChecknoteParticipantInfo participants,
      ChecknoteCheckInfo checkInfo,
      List<ChecknoteCheckItem> checkItems,
      ChecknoteAccordionInfo accordionInfo,
      ChecknoteTabInfo tabInfo,
      ChecknoteStats stats,
      DateTime createdAt,
      DateTime updatedAt});

  @override
  $ChecknoteMasterInfoCopyWith<$Res> get master;
  @override
  $ChecknoteParticipantInfoCopyWith<$Res> get participants;
  @override
  $ChecknoteCheckInfoCopyWith<$Res> get checkInfo;
  @override
  $ChecknoteAccordionInfoCopyWith<$Res> get accordionInfo;
  @override
  $ChecknoteTabInfoCopyWith<$Res> get tabInfo;
  @override
  $ChecknoteStatsCopyWith<$Res> get stats;
}

/// @nodoc
class __$$ChecknoteDetailEntityImplCopyWithImpl<$Res>
    extends _$ChecknoteDetailEntityCopyWithImpl<$Res,
        _$ChecknoteDetailEntityImpl>
    implements _$$ChecknoteDetailEntityImplCopyWith<$Res> {
  __$$ChecknoteDetailEntityImplCopyWithImpl(_$ChecknoteDetailEntityImpl _value,
      $Res Function(_$ChecknoteDetailEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChecknoteDetailEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? hashtags = null,
    Object? description = null,
    Object? imageUrls = null,
    Object? type = null,
    Object? status = null,
    Object? master = null,
    Object? participants = null,
    Object? checkInfo = null,
    Object? checkItems = null,
    Object? accordionInfo = null,
    Object? tabInfo = null,
    Object? stats = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$ChecknoteDetailEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      hashtags: null == hashtags
          ? _value._hashtags
          : hashtags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrls: null == imageUrls
          ? _value._imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ChecknoteType,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ChecknoteStatus,
      master: null == master
          ? _value.master
          : master // ignore: cast_nullable_to_non_nullable
              as ChecknoteMasterInfo,
      participants: null == participants
          ? _value.participants
          : participants // ignore: cast_nullable_to_non_nullable
              as ChecknoteParticipantInfo,
      checkInfo: null == checkInfo
          ? _value.checkInfo
          : checkInfo // ignore: cast_nullable_to_non_nullable
              as ChecknoteCheckInfo,
      checkItems: null == checkItems
          ? _value._checkItems
          : checkItems // ignore: cast_nullable_to_non_nullable
              as List<ChecknoteCheckItem>,
      accordionInfo: null == accordionInfo
          ? _value.accordionInfo
          : accordionInfo // ignore: cast_nullable_to_non_nullable
              as ChecknoteAccordionInfo,
      tabInfo: null == tabInfo
          ? _value.tabInfo
          : tabInfo // ignore: cast_nullable_to_non_nullable
              as ChecknoteTabInfo,
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as ChecknoteStats,
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
class _$ChecknoteDetailEntityImpl implements _ChecknoteDetailEntity {
  const _$ChecknoteDetailEntityImpl(
      {required this.id,
      required this.title,
      required final List<String> hashtags,
      required this.description,
      required final List<String> imageUrls,
      required this.type,
      required this.status,
      required this.master,
      required this.participants,
      required this.checkInfo,
      required final List<ChecknoteCheckItem> checkItems,
      required this.accordionInfo,
      required this.tabInfo,
      required this.stats,
      required this.createdAt,
      required this.updatedAt})
      : _hashtags = hashtags,
        _imageUrls = imageUrls,
        _checkItems = checkItems;

  factory _$ChecknoteDetailEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChecknoteDetailEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  final List<String> _hashtags;
  @override
  List<String> get hashtags {
    if (_hashtags is EqualUnmodifiableListView) return _hashtags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hashtags);
  }

  @override
  final String description;
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
  final ChecknoteStatus status;
  @override
  final ChecknoteMasterInfo master;
  @override
  final ChecknoteParticipantInfo participants;
  @override
  final ChecknoteCheckInfo checkInfo;
  final List<ChecknoteCheckItem> _checkItems;
  @override
  List<ChecknoteCheckItem> get checkItems {
    if (_checkItems is EqualUnmodifiableListView) return _checkItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_checkItems);
  }

  @override
  final ChecknoteAccordionInfo accordionInfo;
  @override
  final ChecknoteTabInfo tabInfo;
  @override
  final ChecknoteStats stats;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'ChecknoteDetailEntity(id: $id, title: $title, hashtags: $hashtags, description: $description, imageUrls: $imageUrls, type: $type, status: $status, master: $master, participants: $participants, checkInfo: $checkInfo, checkItems: $checkItems, accordionInfo: $accordionInfo, tabInfo: $tabInfo, stats: $stats, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChecknoteDetailEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._hashtags, _hashtags) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._imageUrls, _imageUrls) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.master, master) || other.master == master) &&
            (identical(other.participants, participants) ||
                other.participants == participants) &&
            (identical(other.checkInfo, checkInfo) ||
                other.checkInfo == checkInfo) &&
            const DeepCollectionEquality()
                .equals(other._checkItems, _checkItems) &&
            (identical(other.accordionInfo, accordionInfo) ||
                other.accordionInfo == accordionInfo) &&
            (identical(other.tabInfo, tabInfo) || other.tabInfo == tabInfo) &&
            (identical(other.stats, stats) || other.stats == stats) &&
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
      title,
      const DeepCollectionEquality().hash(_hashtags),
      description,
      const DeepCollectionEquality().hash(_imageUrls),
      type,
      status,
      master,
      participants,
      checkInfo,
      const DeepCollectionEquality().hash(_checkItems),
      accordionInfo,
      tabInfo,
      stats,
      createdAt,
      updatedAt);

  /// Create a copy of ChecknoteDetailEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChecknoteDetailEntityImplCopyWith<_$ChecknoteDetailEntityImpl>
      get copyWith => __$$ChecknoteDetailEntityImplCopyWithImpl<
          _$ChecknoteDetailEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChecknoteDetailEntityImplToJson(
      this,
    );
  }
}

abstract class _ChecknoteDetailEntity implements ChecknoteDetailEntity {
  const factory _ChecknoteDetailEntity(
      {required final String id,
      required final String title,
      required final List<String> hashtags,
      required final String description,
      required final List<String> imageUrls,
      required final ChecknoteType type,
      required final ChecknoteStatus status,
      required final ChecknoteMasterInfo master,
      required final ChecknoteParticipantInfo participants,
      required final ChecknoteCheckInfo checkInfo,
      required final List<ChecknoteCheckItem> checkItems,
      required final ChecknoteAccordionInfo accordionInfo,
      required final ChecknoteTabInfo tabInfo,
      required final ChecknoteStats stats,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$ChecknoteDetailEntityImpl;

  factory _ChecknoteDetailEntity.fromJson(Map<String, dynamic> json) =
      _$ChecknoteDetailEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  List<String> get hashtags;
  @override
  String get description;
  @override
  List<String> get imageUrls;
  @override
  ChecknoteType get type;
  @override
  ChecknoteStatus get status;
  @override
  ChecknoteMasterInfo get master;
  @override
  ChecknoteParticipantInfo get participants;
  @override
  ChecknoteCheckInfo get checkInfo;
  @override
  List<ChecknoteCheckItem> get checkItems;
  @override
  ChecknoteAccordionInfo get accordionInfo;
  @override
  ChecknoteTabInfo get tabInfo;
  @override
  ChecknoteStats get stats;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of ChecknoteDetailEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChecknoteDetailEntityImplCopyWith<_$ChecknoteDetailEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ChecknoteMasterInfo _$ChecknoteMasterInfoFromJson(Map<String, dynamic> json) {
  return _ChecknoteMasterInfo.fromJson(json);
}

/// @nodoc
mixin _$ChecknoteMasterInfo {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get profileImageUrl => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;

  /// Serializes this ChecknoteMasterInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChecknoteMasterInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChecknoteMasterInfoCopyWith<ChecknoteMasterInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChecknoteMasterInfoCopyWith<$Res> {
  factory $ChecknoteMasterInfoCopyWith(
          ChecknoteMasterInfo value, $Res Function(ChecknoteMasterInfo) then) =
      _$ChecknoteMasterInfoCopyWithImpl<$Res, ChecknoteMasterInfo>;
  @useResult
  $Res call({String id, String name, String? profileImageUrl, String? bio});
}

/// @nodoc
class _$ChecknoteMasterInfoCopyWithImpl<$Res, $Val extends ChecknoteMasterInfo>
    implements $ChecknoteMasterInfoCopyWith<$Res> {
  _$ChecknoteMasterInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChecknoteMasterInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? profileImageUrl = freezed,
    Object? bio = freezed,
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
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChecknoteMasterInfoImplCopyWith<$Res>
    implements $ChecknoteMasterInfoCopyWith<$Res> {
  factory _$$ChecknoteMasterInfoImplCopyWith(_$ChecknoteMasterInfoImpl value,
          $Res Function(_$ChecknoteMasterInfoImpl) then) =
      __$$ChecknoteMasterInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String? profileImageUrl, String? bio});
}

/// @nodoc
class __$$ChecknoteMasterInfoImplCopyWithImpl<$Res>
    extends _$ChecknoteMasterInfoCopyWithImpl<$Res, _$ChecknoteMasterInfoImpl>
    implements _$$ChecknoteMasterInfoImplCopyWith<$Res> {
  __$$ChecknoteMasterInfoImplCopyWithImpl(_$ChecknoteMasterInfoImpl _value,
      $Res Function(_$ChecknoteMasterInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChecknoteMasterInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? profileImageUrl = freezed,
    Object? bio = freezed,
  }) {
    return _then(_$ChecknoteMasterInfoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChecknoteMasterInfoImpl implements _ChecknoteMasterInfo {
  const _$ChecknoteMasterInfoImpl(
      {required this.id,
      required this.name,
      required this.profileImageUrl,
      required this.bio});

  factory _$ChecknoteMasterInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChecknoteMasterInfoImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? profileImageUrl;
  @override
  final String? bio;

  @override
  String toString() {
    return 'ChecknoteMasterInfo(id: $id, name: $name, profileImageUrl: $profileImageUrl, bio: $bio)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChecknoteMasterInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl) &&
            (identical(other.bio, bio) || other.bio == bio));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, profileImageUrl, bio);

  /// Create a copy of ChecknoteMasterInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChecknoteMasterInfoImplCopyWith<_$ChecknoteMasterInfoImpl> get copyWith =>
      __$$ChecknoteMasterInfoImplCopyWithImpl<_$ChecknoteMasterInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChecknoteMasterInfoImplToJson(
      this,
    );
  }
}

abstract class _ChecknoteMasterInfo implements ChecknoteMasterInfo {
  const factory _ChecknoteMasterInfo(
      {required final String id,
      required final String name,
      required final String? profileImageUrl,
      required final String? bio}) = _$ChecknoteMasterInfoImpl;

  factory _ChecknoteMasterInfo.fromJson(Map<String, dynamic> json) =
      _$ChecknoteMasterInfoImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get profileImageUrl;
  @override
  String? get bio;

  /// Create a copy of ChecknoteMasterInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChecknoteMasterInfoImplCopyWith<_$ChecknoteMasterInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChecknoteParticipantInfo _$ChecknoteParticipantInfoFromJson(
    Map<String, dynamic> json) {
  return _ChecknoteParticipantInfo.fromJson(json);
}

/// @nodoc
mixin _$ChecknoteParticipantInfo {
  int get currentCount => throw _privateConstructorUsedError;
  int get maxCount => throw _privateConstructorUsedError;
  List<ChecknoteParticipant> get participants =>
      throw _privateConstructorUsedError;

  /// Serializes this ChecknoteParticipantInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChecknoteParticipantInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChecknoteParticipantInfoCopyWith<ChecknoteParticipantInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChecknoteParticipantInfoCopyWith<$Res> {
  factory $ChecknoteParticipantInfoCopyWith(ChecknoteParticipantInfo value,
          $Res Function(ChecknoteParticipantInfo) then) =
      _$ChecknoteParticipantInfoCopyWithImpl<$Res, ChecknoteParticipantInfo>;
  @useResult
  $Res call(
      {int currentCount,
      int maxCount,
      List<ChecknoteParticipant> participants});
}

/// @nodoc
class _$ChecknoteParticipantInfoCopyWithImpl<$Res,
        $Val extends ChecknoteParticipantInfo>
    implements $ChecknoteParticipantInfoCopyWith<$Res> {
  _$ChecknoteParticipantInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChecknoteParticipantInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentCount = null,
    Object? maxCount = null,
    Object? participants = null,
  }) {
    return _then(_value.copyWith(
      currentCount: null == currentCount
          ? _value.currentCount
          : currentCount // ignore: cast_nullable_to_non_nullable
              as int,
      maxCount: null == maxCount
          ? _value.maxCount
          : maxCount // ignore: cast_nullable_to_non_nullable
              as int,
      participants: null == participants
          ? _value.participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<ChecknoteParticipant>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChecknoteParticipantInfoImplCopyWith<$Res>
    implements $ChecknoteParticipantInfoCopyWith<$Res> {
  factory _$$ChecknoteParticipantInfoImplCopyWith(
          _$ChecknoteParticipantInfoImpl value,
          $Res Function(_$ChecknoteParticipantInfoImpl) then) =
      __$$ChecknoteParticipantInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int currentCount,
      int maxCount,
      List<ChecknoteParticipant> participants});
}

/// @nodoc
class __$$ChecknoteParticipantInfoImplCopyWithImpl<$Res>
    extends _$ChecknoteParticipantInfoCopyWithImpl<$Res,
        _$ChecknoteParticipantInfoImpl>
    implements _$$ChecknoteParticipantInfoImplCopyWith<$Res> {
  __$$ChecknoteParticipantInfoImplCopyWithImpl(
      _$ChecknoteParticipantInfoImpl _value,
      $Res Function(_$ChecknoteParticipantInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChecknoteParticipantInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentCount = null,
    Object? maxCount = null,
    Object? participants = null,
  }) {
    return _then(_$ChecknoteParticipantInfoImpl(
      currentCount: null == currentCount
          ? _value.currentCount
          : currentCount // ignore: cast_nullable_to_non_nullable
              as int,
      maxCount: null == maxCount
          ? _value.maxCount
          : maxCount // ignore: cast_nullable_to_non_nullable
              as int,
      participants: null == participants
          ? _value._participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<ChecknoteParticipant>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChecknoteParticipantInfoImpl implements _ChecknoteParticipantInfo {
  const _$ChecknoteParticipantInfoImpl(
      {required this.currentCount,
      required this.maxCount,
      required final List<ChecknoteParticipant> participants})
      : _participants = participants;

  factory _$ChecknoteParticipantInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChecknoteParticipantInfoImplFromJson(json);

  @override
  final int currentCount;
  @override
  final int maxCount;
  final List<ChecknoteParticipant> _participants;
  @override
  List<ChecknoteParticipant> get participants {
    if (_participants is EqualUnmodifiableListView) return _participants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_participants);
  }

  @override
  String toString() {
    return 'ChecknoteParticipantInfo(currentCount: $currentCount, maxCount: $maxCount, participants: $participants)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChecknoteParticipantInfoImpl &&
            (identical(other.currentCount, currentCount) ||
                other.currentCount == currentCount) &&
            (identical(other.maxCount, maxCount) ||
                other.maxCount == maxCount) &&
            const DeepCollectionEquality()
                .equals(other._participants, _participants));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, currentCount, maxCount,
      const DeepCollectionEquality().hash(_participants));

  /// Create a copy of ChecknoteParticipantInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChecknoteParticipantInfoImplCopyWith<_$ChecknoteParticipantInfoImpl>
      get copyWith => __$$ChecknoteParticipantInfoImplCopyWithImpl<
          _$ChecknoteParticipantInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChecknoteParticipantInfoImplToJson(
      this,
    );
  }
}

abstract class _ChecknoteParticipantInfo implements ChecknoteParticipantInfo {
  const factory _ChecknoteParticipantInfo(
          {required final int currentCount,
          required final int maxCount,
          required final List<ChecknoteParticipant> participants}) =
      _$ChecknoteParticipantInfoImpl;

  factory _ChecknoteParticipantInfo.fromJson(Map<String, dynamic> json) =
      _$ChecknoteParticipantInfoImpl.fromJson;

  @override
  int get currentCount;
  @override
  int get maxCount;
  @override
  List<ChecknoteParticipant> get participants;

  /// Create a copy of ChecknoteParticipantInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChecknoteParticipantInfoImplCopyWith<_$ChecknoteParticipantInfoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ChecknoteParticipant _$ChecknoteParticipantFromJson(Map<String, dynamic> json) {
  return _ChecknoteParticipant.fromJson(json);
}

/// @nodoc
mixin _$ChecknoteParticipant {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get profileImageUrl => throw _privateConstructorUsedError;
  ChecknoteParticipantStatus get status => throw _privateConstructorUsedError;
  DateTime get joinedAt => throw _privateConstructorUsedError;

  /// Serializes this ChecknoteParticipant to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChecknoteParticipant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChecknoteParticipantCopyWith<ChecknoteParticipant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChecknoteParticipantCopyWith<$Res> {
  factory $ChecknoteParticipantCopyWith(ChecknoteParticipant value,
          $Res Function(ChecknoteParticipant) then) =
      _$ChecknoteParticipantCopyWithImpl<$Res, ChecknoteParticipant>;
  @useResult
  $Res call(
      {String id,
      String name,
      String? profileImageUrl,
      ChecknoteParticipantStatus status,
      DateTime joinedAt});
}

/// @nodoc
class _$ChecknoteParticipantCopyWithImpl<$Res,
        $Val extends ChecknoteParticipant>
    implements $ChecknoteParticipantCopyWith<$Res> {
  _$ChecknoteParticipantCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChecknoteParticipant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? profileImageUrl = freezed,
    Object? status = null,
    Object? joinedAt = null,
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
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ChecknoteParticipantStatus,
      joinedAt: null == joinedAt
          ? _value.joinedAt
          : joinedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChecknoteParticipantImplCopyWith<$Res>
    implements $ChecknoteParticipantCopyWith<$Res> {
  factory _$$ChecknoteParticipantImplCopyWith(_$ChecknoteParticipantImpl value,
          $Res Function(_$ChecknoteParticipantImpl) then) =
      __$$ChecknoteParticipantImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String? profileImageUrl,
      ChecknoteParticipantStatus status,
      DateTime joinedAt});
}

/// @nodoc
class __$$ChecknoteParticipantImplCopyWithImpl<$Res>
    extends _$ChecknoteParticipantCopyWithImpl<$Res, _$ChecknoteParticipantImpl>
    implements _$$ChecknoteParticipantImplCopyWith<$Res> {
  __$$ChecknoteParticipantImplCopyWithImpl(_$ChecknoteParticipantImpl _value,
      $Res Function(_$ChecknoteParticipantImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChecknoteParticipant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? profileImageUrl = freezed,
    Object? status = null,
    Object? joinedAt = null,
  }) {
    return _then(_$ChecknoteParticipantImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ChecknoteParticipantStatus,
      joinedAt: null == joinedAt
          ? _value.joinedAt
          : joinedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChecknoteParticipantImpl implements _ChecknoteParticipant {
  const _$ChecknoteParticipantImpl(
      {required this.id,
      required this.name,
      required this.profileImageUrl,
      required this.status,
      required this.joinedAt});

  factory _$ChecknoteParticipantImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChecknoteParticipantImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? profileImageUrl;
  @override
  final ChecknoteParticipantStatus status;
  @override
  final DateTime joinedAt;

  @override
  String toString() {
    return 'ChecknoteParticipant(id: $id, name: $name, profileImageUrl: $profileImageUrl, status: $status, joinedAt: $joinedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChecknoteParticipantImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.joinedAt, joinedAt) ||
                other.joinedAt == joinedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, profileImageUrl, status, joinedAt);

  /// Create a copy of ChecknoteParticipant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChecknoteParticipantImplCopyWith<_$ChecknoteParticipantImpl>
      get copyWith =>
          __$$ChecknoteParticipantImplCopyWithImpl<_$ChecknoteParticipantImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChecknoteParticipantImplToJson(
      this,
    );
  }
}

abstract class _ChecknoteParticipant implements ChecknoteParticipant {
  const factory _ChecknoteParticipant(
      {required final String id,
      required final String name,
      required final String? profileImageUrl,
      required final ChecknoteParticipantStatus status,
      required final DateTime joinedAt}) = _$ChecknoteParticipantImpl;

  factory _ChecknoteParticipant.fromJson(Map<String, dynamic> json) =
      _$ChecknoteParticipantImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get profileImageUrl;
  @override
  ChecknoteParticipantStatus get status;
  @override
  DateTime get joinedAt;

  /// Create a copy of ChecknoteParticipant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChecknoteParticipantImplCopyWith<_$ChecknoteParticipantImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ChecknoteCheckInfo _$ChecknoteCheckInfoFromJson(Map<String, dynamic> json) {
  return _ChecknoteCheckInfo.fromJson(json);
}

/// @nodoc
mixin _$ChecknoteCheckInfo {
  int get currentCount => throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;
  DateTime? get lastCheckAt => throw _privateConstructorUsedError;
  ChecknoteCheckSchedule? get schedule => throw _privateConstructorUsedError;

  /// Serializes this ChecknoteCheckInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChecknoteCheckInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChecknoteCheckInfoCopyWith<ChecknoteCheckInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChecknoteCheckInfoCopyWith<$Res> {
  factory $ChecknoteCheckInfoCopyWith(
          ChecknoteCheckInfo value, $Res Function(ChecknoteCheckInfo) then) =
      _$ChecknoteCheckInfoCopyWithImpl<$Res, ChecknoteCheckInfo>;
  @useResult
  $Res call(
      {int currentCount,
      int totalCount,
      DateTime? lastCheckAt,
      ChecknoteCheckSchedule? schedule});

  $ChecknoteCheckScheduleCopyWith<$Res>? get schedule;
}

/// @nodoc
class _$ChecknoteCheckInfoCopyWithImpl<$Res, $Val extends ChecknoteCheckInfo>
    implements $ChecknoteCheckInfoCopyWith<$Res> {
  _$ChecknoteCheckInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChecknoteCheckInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentCount = null,
    Object? totalCount = null,
    Object? lastCheckAt = freezed,
    Object? schedule = freezed,
  }) {
    return _then(_value.copyWith(
      currentCount: null == currentCount
          ? _value.currentCount
          : currentCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      lastCheckAt: freezed == lastCheckAt
          ? _value.lastCheckAt
          : lastCheckAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      schedule: freezed == schedule
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as ChecknoteCheckSchedule?,
    ) as $Val);
  }

  /// Create a copy of ChecknoteCheckInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChecknoteCheckScheduleCopyWith<$Res>? get schedule {
    if (_value.schedule == null) {
      return null;
    }

    return $ChecknoteCheckScheduleCopyWith<$Res>(_value.schedule!, (value) {
      return _then(_value.copyWith(schedule: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChecknoteCheckInfoImplCopyWith<$Res>
    implements $ChecknoteCheckInfoCopyWith<$Res> {
  factory _$$ChecknoteCheckInfoImplCopyWith(_$ChecknoteCheckInfoImpl value,
          $Res Function(_$ChecknoteCheckInfoImpl) then) =
      __$$ChecknoteCheckInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int currentCount,
      int totalCount,
      DateTime? lastCheckAt,
      ChecknoteCheckSchedule? schedule});

  @override
  $ChecknoteCheckScheduleCopyWith<$Res>? get schedule;
}

/// @nodoc
class __$$ChecknoteCheckInfoImplCopyWithImpl<$Res>
    extends _$ChecknoteCheckInfoCopyWithImpl<$Res, _$ChecknoteCheckInfoImpl>
    implements _$$ChecknoteCheckInfoImplCopyWith<$Res> {
  __$$ChecknoteCheckInfoImplCopyWithImpl(_$ChecknoteCheckInfoImpl _value,
      $Res Function(_$ChecknoteCheckInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChecknoteCheckInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentCount = null,
    Object? totalCount = null,
    Object? lastCheckAt = freezed,
    Object? schedule = freezed,
  }) {
    return _then(_$ChecknoteCheckInfoImpl(
      currentCount: null == currentCount
          ? _value.currentCount
          : currentCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      lastCheckAt: freezed == lastCheckAt
          ? _value.lastCheckAt
          : lastCheckAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      schedule: freezed == schedule
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as ChecknoteCheckSchedule?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChecknoteCheckInfoImpl implements _ChecknoteCheckInfo {
  const _$ChecknoteCheckInfoImpl(
      {required this.currentCount,
      required this.totalCount,
      required this.lastCheckAt,
      required this.schedule});

  factory _$ChecknoteCheckInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChecknoteCheckInfoImplFromJson(json);

  @override
  final int currentCount;
  @override
  final int totalCount;
  @override
  final DateTime? lastCheckAt;
  @override
  final ChecknoteCheckSchedule? schedule;

  @override
  String toString() {
    return 'ChecknoteCheckInfo(currentCount: $currentCount, totalCount: $totalCount, lastCheckAt: $lastCheckAt, schedule: $schedule)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChecknoteCheckInfoImpl &&
            (identical(other.currentCount, currentCount) ||
                other.currentCount == currentCount) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.lastCheckAt, lastCheckAt) ||
                other.lastCheckAt == lastCheckAt) &&
            (identical(other.schedule, schedule) ||
                other.schedule == schedule));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, currentCount, totalCount, lastCheckAt, schedule);

  /// Create a copy of ChecknoteCheckInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChecknoteCheckInfoImplCopyWith<_$ChecknoteCheckInfoImpl> get copyWith =>
      __$$ChecknoteCheckInfoImplCopyWithImpl<_$ChecknoteCheckInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChecknoteCheckInfoImplToJson(
      this,
    );
  }
}

abstract class _ChecknoteCheckInfo implements ChecknoteCheckInfo {
  const factory _ChecknoteCheckInfo(
          {required final int currentCount,
          required final int totalCount,
          required final DateTime? lastCheckAt,
          required final ChecknoteCheckSchedule? schedule}) =
      _$ChecknoteCheckInfoImpl;

  factory _ChecknoteCheckInfo.fromJson(Map<String, dynamic> json) =
      _$ChecknoteCheckInfoImpl.fromJson;

  @override
  int get currentCount;
  @override
  int get totalCount;
  @override
  DateTime? get lastCheckAt;
  @override
  ChecknoteCheckSchedule? get schedule;

  /// Create a copy of ChecknoteCheckInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChecknoteCheckInfoImplCopyWith<_$ChecknoteCheckInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChecknoteCheckItem _$ChecknoteCheckItemFromJson(Map<String, dynamic> json) {
  return _ChecknoteCheckItem.fromJson(json);
}

/// @nodoc
mixin _$ChecknoteCheckItem {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  ChecknoteCheckItemColor get color => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;
  bool get isAvailable => throw _privateConstructorUsedError;
  ChecknoteCheckSchedule? get schedule => throw _privateConstructorUsedError;
  ChecknoteCheckTime? get time => throw _privateConstructorUsedError;
  String? get checkSchedule => throw _privateConstructorUsedError;
  String? get remainingTime => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;

  /// Serializes this ChecknoteCheckItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChecknoteCheckItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChecknoteCheckItemCopyWith<ChecknoteCheckItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChecknoteCheckItemCopyWith<$Res> {
  factory $ChecknoteCheckItemCopyWith(
          ChecknoteCheckItem value, $Res Function(ChecknoteCheckItem) then) =
      _$ChecknoteCheckItemCopyWithImpl<$Res, ChecknoteCheckItem>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      ChecknoteCheckItemColor color,
      bool isCompleted,
      bool isAvailable,
      ChecknoteCheckSchedule? schedule,
      ChecknoteCheckTime? time,
      String? checkSchedule,
      String? remainingTime,
      DateTime? completedAt});

  $ChecknoteCheckScheduleCopyWith<$Res>? get schedule;
  $ChecknoteCheckTimeCopyWith<$Res>? get time;
}

/// @nodoc
class _$ChecknoteCheckItemCopyWithImpl<$Res, $Val extends ChecknoteCheckItem>
    implements $ChecknoteCheckItemCopyWith<$Res> {
  _$ChecknoteCheckItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChecknoteCheckItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? color = null,
    Object? isCompleted = null,
    Object? isAvailable = null,
    Object? schedule = freezed,
    Object? time = freezed,
    Object? checkSchedule = freezed,
    Object? remainingTime = freezed,
    Object? completedAt = freezed,
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as ChecknoteCheckItemColor,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      schedule: freezed == schedule
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as ChecknoteCheckSchedule?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as ChecknoteCheckTime?,
      checkSchedule: freezed == checkSchedule
          ? _value.checkSchedule
          : checkSchedule // ignore: cast_nullable_to_non_nullable
              as String?,
      remainingTime: freezed == remainingTime
          ? _value.remainingTime
          : remainingTime // ignore: cast_nullable_to_non_nullable
              as String?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of ChecknoteCheckItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChecknoteCheckScheduleCopyWith<$Res>? get schedule {
    if (_value.schedule == null) {
      return null;
    }

    return $ChecknoteCheckScheduleCopyWith<$Res>(_value.schedule!, (value) {
      return _then(_value.copyWith(schedule: value) as $Val);
    });
  }

  /// Create a copy of ChecknoteCheckItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChecknoteCheckTimeCopyWith<$Res>? get time {
    if (_value.time == null) {
      return null;
    }

    return $ChecknoteCheckTimeCopyWith<$Res>(_value.time!, (value) {
      return _then(_value.copyWith(time: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChecknoteCheckItemImplCopyWith<$Res>
    implements $ChecknoteCheckItemCopyWith<$Res> {
  factory _$$ChecknoteCheckItemImplCopyWith(_$ChecknoteCheckItemImpl value,
          $Res Function(_$ChecknoteCheckItemImpl) then) =
      __$$ChecknoteCheckItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      ChecknoteCheckItemColor color,
      bool isCompleted,
      bool isAvailable,
      ChecknoteCheckSchedule? schedule,
      ChecknoteCheckTime? time,
      String? checkSchedule,
      String? remainingTime,
      DateTime? completedAt});

  @override
  $ChecknoteCheckScheduleCopyWith<$Res>? get schedule;
  @override
  $ChecknoteCheckTimeCopyWith<$Res>? get time;
}

/// @nodoc
class __$$ChecknoteCheckItemImplCopyWithImpl<$Res>
    extends _$ChecknoteCheckItemCopyWithImpl<$Res, _$ChecknoteCheckItemImpl>
    implements _$$ChecknoteCheckItemImplCopyWith<$Res> {
  __$$ChecknoteCheckItemImplCopyWithImpl(_$ChecknoteCheckItemImpl _value,
      $Res Function(_$ChecknoteCheckItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChecknoteCheckItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? color = null,
    Object? isCompleted = null,
    Object? isAvailable = null,
    Object? schedule = freezed,
    Object? time = freezed,
    Object? checkSchedule = freezed,
    Object? remainingTime = freezed,
    Object? completedAt = freezed,
  }) {
    return _then(_$ChecknoteCheckItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as ChecknoteCheckItemColor,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      schedule: freezed == schedule
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as ChecknoteCheckSchedule?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as ChecknoteCheckTime?,
      checkSchedule: freezed == checkSchedule
          ? _value.checkSchedule
          : checkSchedule // ignore: cast_nullable_to_non_nullable
              as String?,
      remainingTime: freezed == remainingTime
          ? _value.remainingTime
          : remainingTime // ignore: cast_nullable_to_non_nullable
              as String?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChecknoteCheckItemImpl implements _ChecknoteCheckItem {
  const _$ChecknoteCheckItemImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.color,
      required this.isCompleted,
      required this.isAvailable,
      required this.schedule,
      required this.time,
      required this.checkSchedule,
      required this.remainingTime,
      required this.completedAt});

  factory _$ChecknoteCheckItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChecknoteCheckItemImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final ChecknoteCheckItemColor color;
  @override
  final bool isCompleted;
  @override
  final bool isAvailable;
  @override
  final ChecknoteCheckSchedule? schedule;
  @override
  final ChecknoteCheckTime? time;
  @override
  final String? checkSchedule;
  @override
  final String? remainingTime;
  @override
  final DateTime? completedAt;

  @override
  String toString() {
    return 'ChecknoteCheckItem(id: $id, title: $title, description: $description, color: $color, isCompleted: $isCompleted, isAvailable: $isAvailable, schedule: $schedule, time: $time, checkSchedule: $checkSchedule, remainingTime: $remainingTime, completedAt: $completedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChecknoteCheckItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.schedule, schedule) ||
                other.schedule == schedule) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.checkSchedule, checkSchedule) ||
                other.checkSchedule == checkSchedule) &&
            (identical(other.remainingTime, remainingTime) ||
                other.remainingTime == remainingTime) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      color,
      isCompleted,
      isAvailable,
      schedule,
      time,
      checkSchedule,
      remainingTime,
      completedAt);

  /// Create a copy of ChecknoteCheckItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChecknoteCheckItemImplCopyWith<_$ChecknoteCheckItemImpl> get copyWith =>
      __$$ChecknoteCheckItemImplCopyWithImpl<_$ChecknoteCheckItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChecknoteCheckItemImplToJson(
      this,
    );
  }
}

abstract class _ChecknoteCheckItem implements ChecknoteCheckItem {
  const factory _ChecknoteCheckItem(
      {required final String id,
      required final String title,
      required final String description,
      required final ChecknoteCheckItemColor color,
      required final bool isCompleted,
      required final bool isAvailable,
      required final ChecknoteCheckSchedule? schedule,
      required final ChecknoteCheckTime? time,
      required final String? checkSchedule,
      required final String? remainingTime,
      required final DateTime? completedAt}) = _$ChecknoteCheckItemImpl;

  factory _ChecknoteCheckItem.fromJson(Map<String, dynamic> json) =
      _$ChecknoteCheckItemImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  ChecknoteCheckItemColor get color;
  @override
  bool get isCompleted;
  @override
  bool get isAvailable;
  @override
  ChecknoteCheckSchedule? get schedule;
  @override
  ChecknoteCheckTime? get time;
  @override
  String? get checkSchedule;
  @override
  String? get remainingTime;
  @override
  DateTime? get completedAt;

  /// Create a copy of ChecknoteCheckItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChecknoteCheckItemImplCopyWith<_$ChecknoteCheckItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChecknoteCheckSchedule _$ChecknoteCheckScheduleFromJson(
    Map<String, dynamic> json) {
  return _ChecknoteCheckSchedule.fromJson(json);
}

/// @nodoc
mixin _$ChecknoteCheckSchedule {
  ChecknoteScheduleType get type => throw _privateConstructorUsedError;
  int get frequency => throw _privateConstructorUsedError;
  List<int> get daysOfWeek =>
      throw _privateConstructorUsedError; // 0=일요일, 1=월요일, ...
  ChecknoteCheckTime? get timeRange => throw _privateConstructorUsedError;

  /// Serializes this ChecknoteCheckSchedule to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChecknoteCheckSchedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChecknoteCheckScheduleCopyWith<ChecknoteCheckSchedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChecknoteCheckScheduleCopyWith<$Res> {
  factory $ChecknoteCheckScheduleCopyWith(ChecknoteCheckSchedule value,
          $Res Function(ChecknoteCheckSchedule) then) =
      _$ChecknoteCheckScheduleCopyWithImpl<$Res, ChecknoteCheckSchedule>;
  @useResult
  $Res call(
      {ChecknoteScheduleType type,
      int frequency,
      List<int> daysOfWeek,
      ChecknoteCheckTime? timeRange});

  $ChecknoteCheckTimeCopyWith<$Res>? get timeRange;
}

/// @nodoc
class _$ChecknoteCheckScheduleCopyWithImpl<$Res,
        $Val extends ChecknoteCheckSchedule>
    implements $ChecknoteCheckScheduleCopyWith<$Res> {
  _$ChecknoteCheckScheduleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChecknoteCheckSchedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? frequency = null,
    Object? daysOfWeek = null,
    Object? timeRange = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ChecknoteScheduleType,
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as int,
      daysOfWeek: null == daysOfWeek
          ? _value.daysOfWeek
          : daysOfWeek // ignore: cast_nullable_to_non_nullable
              as List<int>,
      timeRange: freezed == timeRange
          ? _value.timeRange
          : timeRange // ignore: cast_nullable_to_non_nullable
              as ChecknoteCheckTime?,
    ) as $Val);
  }

  /// Create a copy of ChecknoteCheckSchedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChecknoteCheckTimeCopyWith<$Res>? get timeRange {
    if (_value.timeRange == null) {
      return null;
    }

    return $ChecknoteCheckTimeCopyWith<$Res>(_value.timeRange!, (value) {
      return _then(_value.copyWith(timeRange: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChecknoteCheckScheduleImplCopyWith<$Res>
    implements $ChecknoteCheckScheduleCopyWith<$Res> {
  factory _$$ChecknoteCheckScheduleImplCopyWith(
          _$ChecknoteCheckScheduleImpl value,
          $Res Function(_$ChecknoteCheckScheduleImpl) then) =
      __$$ChecknoteCheckScheduleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ChecknoteScheduleType type,
      int frequency,
      List<int> daysOfWeek,
      ChecknoteCheckTime? timeRange});

  @override
  $ChecknoteCheckTimeCopyWith<$Res>? get timeRange;
}

/// @nodoc
class __$$ChecknoteCheckScheduleImplCopyWithImpl<$Res>
    extends _$ChecknoteCheckScheduleCopyWithImpl<$Res,
        _$ChecknoteCheckScheduleImpl>
    implements _$$ChecknoteCheckScheduleImplCopyWith<$Res> {
  __$$ChecknoteCheckScheduleImplCopyWithImpl(
      _$ChecknoteCheckScheduleImpl _value,
      $Res Function(_$ChecknoteCheckScheduleImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChecknoteCheckSchedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? frequency = null,
    Object? daysOfWeek = null,
    Object? timeRange = freezed,
  }) {
    return _then(_$ChecknoteCheckScheduleImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ChecknoteScheduleType,
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as int,
      daysOfWeek: null == daysOfWeek
          ? _value._daysOfWeek
          : daysOfWeek // ignore: cast_nullable_to_non_nullable
              as List<int>,
      timeRange: freezed == timeRange
          ? _value.timeRange
          : timeRange // ignore: cast_nullable_to_non_nullable
              as ChecknoteCheckTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChecknoteCheckScheduleImpl implements _ChecknoteCheckSchedule {
  const _$ChecknoteCheckScheduleImpl(
      {required this.type,
      required this.frequency,
      required final List<int> daysOfWeek,
      required this.timeRange})
      : _daysOfWeek = daysOfWeek;

  factory _$ChecknoteCheckScheduleImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChecknoteCheckScheduleImplFromJson(json);

  @override
  final ChecknoteScheduleType type;
  @override
  final int frequency;
  final List<int> _daysOfWeek;
  @override
  List<int> get daysOfWeek {
    if (_daysOfWeek is EqualUnmodifiableListView) return _daysOfWeek;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_daysOfWeek);
  }

// 0=일요일, 1=월요일, ...
  @override
  final ChecknoteCheckTime? timeRange;

  @override
  String toString() {
    return 'ChecknoteCheckSchedule(type: $type, frequency: $frequency, daysOfWeek: $daysOfWeek, timeRange: $timeRange)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChecknoteCheckScheduleImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency) &&
            const DeepCollectionEquality()
                .equals(other._daysOfWeek, _daysOfWeek) &&
            (identical(other.timeRange, timeRange) ||
                other.timeRange == timeRange));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, frequency,
      const DeepCollectionEquality().hash(_daysOfWeek), timeRange);

  /// Create a copy of ChecknoteCheckSchedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChecknoteCheckScheduleImplCopyWith<_$ChecknoteCheckScheduleImpl>
      get copyWith => __$$ChecknoteCheckScheduleImplCopyWithImpl<
          _$ChecknoteCheckScheduleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChecknoteCheckScheduleImplToJson(
      this,
    );
  }
}

abstract class _ChecknoteCheckSchedule implements ChecknoteCheckSchedule {
  const factory _ChecknoteCheckSchedule(
          {required final ChecknoteScheduleType type,
          required final int frequency,
          required final List<int> daysOfWeek,
          required final ChecknoteCheckTime? timeRange}) =
      _$ChecknoteCheckScheduleImpl;

  factory _ChecknoteCheckSchedule.fromJson(Map<String, dynamic> json) =
      _$ChecknoteCheckScheduleImpl.fromJson;

  @override
  ChecknoteScheduleType get type;
  @override
  int get frequency;
  @override
  List<int> get daysOfWeek; // 0=일요일, 1=월요일, ...
  @override
  ChecknoteCheckTime? get timeRange;

  /// Create a copy of ChecknoteCheckSchedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChecknoteCheckScheduleImplCopyWith<_$ChecknoteCheckScheduleImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ChecknoteCheckTime _$ChecknoteCheckTimeFromJson(Map<String, dynamic> json) {
  return _ChecknoteCheckTime.fromJson(json);
}

/// @nodoc
mixin _$ChecknoteCheckTime {
  String get startTime => throw _privateConstructorUsedError; // "22:00"
  String get endTime => throw _privateConstructorUsedError;

  /// Serializes this ChecknoteCheckTime to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChecknoteCheckTime
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChecknoteCheckTimeCopyWith<ChecknoteCheckTime> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChecknoteCheckTimeCopyWith<$Res> {
  factory $ChecknoteCheckTimeCopyWith(
          ChecknoteCheckTime value, $Res Function(ChecknoteCheckTime) then) =
      _$ChecknoteCheckTimeCopyWithImpl<$Res, ChecknoteCheckTime>;
  @useResult
  $Res call({String startTime, String endTime});
}

/// @nodoc
class _$ChecknoteCheckTimeCopyWithImpl<$Res, $Val extends ChecknoteCheckTime>
    implements $ChecknoteCheckTimeCopyWith<$Res> {
  _$ChecknoteCheckTimeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChecknoteCheckTime
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startTime = null,
    Object? endTime = null,
  }) {
    return _then(_value.copyWith(
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChecknoteCheckTimeImplCopyWith<$Res>
    implements $ChecknoteCheckTimeCopyWith<$Res> {
  factory _$$ChecknoteCheckTimeImplCopyWith(_$ChecknoteCheckTimeImpl value,
          $Res Function(_$ChecknoteCheckTimeImpl) then) =
      __$$ChecknoteCheckTimeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String startTime, String endTime});
}

/// @nodoc
class __$$ChecknoteCheckTimeImplCopyWithImpl<$Res>
    extends _$ChecknoteCheckTimeCopyWithImpl<$Res, _$ChecknoteCheckTimeImpl>
    implements _$$ChecknoteCheckTimeImplCopyWith<$Res> {
  __$$ChecknoteCheckTimeImplCopyWithImpl(_$ChecknoteCheckTimeImpl _value,
      $Res Function(_$ChecknoteCheckTimeImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChecknoteCheckTime
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startTime = null,
    Object? endTime = null,
  }) {
    return _then(_$ChecknoteCheckTimeImpl(
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChecknoteCheckTimeImpl implements _ChecknoteCheckTime {
  const _$ChecknoteCheckTimeImpl(
      {required this.startTime, required this.endTime});

  factory _$ChecknoteCheckTimeImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChecknoteCheckTimeImplFromJson(json);

  @override
  final String startTime;
// "22:00"
  @override
  final String endTime;

  @override
  String toString() {
    return 'ChecknoteCheckTime(startTime: $startTime, endTime: $endTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChecknoteCheckTimeImpl &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, startTime, endTime);

  /// Create a copy of ChecknoteCheckTime
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChecknoteCheckTimeImplCopyWith<_$ChecknoteCheckTimeImpl> get copyWith =>
      __$$ChecknoteCheckTimeImplCopyWithImpl<_$ChecknoteCheckTimeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChecknoteCheckTimeImplToJson(
      this,
    );
  }
}

abstract class _ChecknoteCheckTime implements ChecknoteCheckTime {
  const factory _ChecknoteCheckTime(
      {required final String startTime,
      required final String endTime}) = _$ChecknoteCheckTimeImpl;

  factory _ChecknoteCheckTime.fromJson(Map<String, dynamic> json) =
      _$ChecknoteCheckTimeImpl.fromJson;

  @override
  String get startTime; // "22:00"
  @override
  String get endTime;

  /// Create a copy of ChecknoteCheckTime
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChecknoteCheckTimeImplCopyWith<_$ChecknoteCheckTimeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChecknoteAccordionInfo _$ChecknoteAccordionInfoFromJson(
    Map<String, dynamic> json) {
  return _ChecknoteAccordionInfo.fromJson(json);
}

/// @nodoc
mixin _$ChecknoteAccordionInfo {
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;
  bool get isExpanded => throw _privateConstructorUsedError;

  /// Serializes this ChecknoteAccordionInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChecknoteAccordionInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChecknoteAccordionInfoCopyWith<ChecknoteAccordionInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChecknoteAccordionInfoCopyWith<$Res> {
  factory $ChecknoteAccordionInfoCopyWith(ChecknoteAccordionInfo value,
          $Res Function(ChecknoteAccordionInfo) then) =
      _$ChecknoteAccordionInfoCopyWithImpl<$Res, ChecknoteAccordionInfo>;
  @useResult
  $Res call(
      {String title, String content, List<String> images, bool isExpanded});
}

/// @nodoc
class _$ChecknoteAccordionInfoCopyWithImpl<$Res,
        $Val extends ChecknoteAccordionInfo>
    implements $ChecknoteAccordionInfoCopyWith<$Res> {
  _$ChecknoteAccordionInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChecknoteAccordionInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? content = null,
    Object? images = null,
    Object? isExpanded = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isExpanded: null == isExpanded
          ? _value.isExpanded
          : isExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChecknoteAccordionInfoImplCopyWith<$Res>
    implements $ChecknoteAccordionInfoCopyWith<$Res> {
  factory _$$ChecknoteAccordionInfoImplCopyWith(
          _$ChecknoteAccordionInfoImpl value,
          $Res Function(_$ChecknoteAccordionInfoImpl) then) =
      __$$ChecknoteAccordionInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title, String content, List<String> images, bool isExpanded});
}

/// @nodoc
class __$$ChecknoteAccordionInfoImplCopyWithImpl<$Res>
    extends _$ChecknoteAccordionInfoCopyWithImpl<$Res,
        _$ChecknoteAccordionInfoImpl>
    implements _$$ChecknoteAccordionInfoImplCopyWith<$Res> {
  __$$ChecknoteAccordionInfoImplCopyWithImpl(
      _$ChecknoteAccordionInfoImpl _value,
      $Res Function(_$ChecknoteAccordionInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChecknoteAccordionInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? content = null,
    Object? images = null,
    Object? isExpanded = null,
  }) {
    return _then(_$ChecknoteAccordionInfoImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isExpanded: null == isExpanded
          ? _value.isExpanded
          : isExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChecknoteAccordionInfoImpl implements _ChecknoteAccordionInfo {
  const _$ChecknoteAccordionInfoImpl(
      {required this.title,
      required this.content,
      required final List<String> images,
      required this.isExpanded})
      : _images = images;

  factory _$ChecknoteAccordionInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChecknoteAccordionInfoImplFromJson(json);

  @override
  final String title;
  @override
  final String content;
  final List<String> _images;
  @override
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  final bool isExpanded;

  @override
  String toString() {
    return 'ChecknoteAccordionInfo(title: $title, content: $content, images: $images, isExpanded: $isExpanded)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChecknoteAccordionInfoImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.isExpanded, isExpanded) ||
                other.isExpanded == isExpanded));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, content,
      const DeepCollectionEquality().hash(_images), isExpanded);

  /// Create a copy of ChecknoteAccordionInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChecknoteAccordionInfoImplCopyWith<_$ChecknoteAccordionInfoImpl>
      get copyWith => __$$ChecknoteAccordionInfoImplCopyWithImpl<
          _$ChecknoteAccordionInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChecknoteAccordionInfoImplToJson(
      this,
    );
  }
}

abstract class _ChecknoteAccordionInfo implements ChecknoteAccordionInfo {
  const factory _ChecknoteAccordionInfo(
      {required final String title,
      required final String content,
      required final List<String> images,
      required final bool isExpanded}) = _$ChecknoteAccordionInfoImpl;

  factory _ChecknoteAccordionInfo.fromJson(Map<String, dynamic> json) =
      _$ChecknoteAccordionInfoImpl.fromJson;

  @override
  String get title;
  @override
  String get content;
  @override
  List<String> get images;
  @override
  bool get isExpanded;

  /// Create a copy of ChecknoteAccordionInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChecknoteAccordionInfoImplCopyWith<_$ChecknoteAccordionInfoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ChecknoteTabInfo _$ChecknoteTabInfoFromJson(Map<String, dynamic> json) {
  return _ChecknoteTabInfo.fromJson(json);
}

/// @nodoc
mixin _$ChecknoteTabInfo {
  List<String> get tabs => throw _privateConstructorUsedError;
  int get activeIndex => throw _privateConstructorUsedError;

  /// Serializes this ChecknoteTabInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChecknoteTabInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChecknoteTabInfoCopyWith<ChecknoteTabInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChecknoteTabInfoCopyWith<$Res> {
  factory $ChecknoteTabInfoCopyWith(
          ChecknoteTabInfo value, $Res Function(ChecknoteTabInfo) then) =
      _$ChecknoteTabInfoCopyWithImpl<$Res, ChecknoteTabInfo>;
  @useResult
  $Res call({List<String> tabs, int activeIndex});
}

/// @nodoc
class _$ChecknoteTabInfoCopyWithImpl<$Res, $Val extends ChecknoteTabInfo>
    implements $ChecknoteTabInfoCopyWith<$Res> {
  _$ChecknoteTabInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChecknoteTabInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tabs = null,
    Object? activeIndex = null,
  }) {
    return _then(_value.copyWith(
      tabs: null == tabs
          ? _value.tabs
          : tabs // ignore: cast_nullable_to_non_nullable
              as List<String>,
      activeIndex: null == activeIndex
          ? _value.activeIndex
          : activeIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChecknoteTabInfoImplCopyWith<$Res>
    implements $ChecknoteTabInfoCopyWith<$Res> {
  factory _$$ChecknoteTabInfoImplCopyWith(_$ChecknoteTabInfoImpl value,
          $Res Function(_$ChecknoteTabInfoImpl) then) =
      __$$ChecknoteTabInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> tabs, int activeIndex});
}

/// @nodoc
class __$$ChecknoteTabInfoImplCopyWithImpl<$Res>
    extends _$ChecknoteTabInfoCopyWithImpl<$Res, _$ChecknoteTabInfoImpl>
    implements _$$ChecknoteTabInfoImplCopyWith<$Res> {
  __$$ChecknoteTabInfoImplCopyWithImpl(_$ChecknoteTabInfoImpl _value,
      $Res Function(_$ChecknoteTabInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChecknoteTabInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tabs = null,
    Object? activeIndex = null,
  }) {
    return _then(_$ChecknoteTabInfoImpl(
      tabs: null == tabs
          ? _value._tabs
          : tabs // ignore: cast_nullable_to_non_nullable
              as List<String>,
      activeIndex: null == activeIndex
          ? _value.activeIndex
          : activeIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChecknoteTabInfoImpl implements _ChecknoteTabInfo {
  const _$ChecknoteTabInfoImpl(
      {required final List<String> tabs, required this.activeIndex})
      : _tabs = tabs;

  factory _$ChecknoteTabInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChecknoteTabInfoImplFromJson(json);

  final List<String> _tabs;
  @override
  List<String> get tabs {
    if (_tabs is EqualUnmodifiableListView) return _tabs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tabs);
  }

  @override
  final int activeIndex;

  @override
  String toString() {
    return 'ChecknoteTabInfo(tabs: $tabs, activeIndex: $activeIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChecknoteTabInfoImpl &&
            const DeepCollectionEquality().equals(other._tabs, _tabs) &&
            (identical(other.activeIndex, activeIndex) ||
                other.activeIndex == activeIndex));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_tabs), activeIndex);

  /// Create a copy of ChecknoteTabInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChecknoteTabInfoImplCopyWith<_$ChecknoteTabInfoImpl> get copyWith =>
      __$$ChecknoteTabInfoImplCopyWithImpl<_$ChecknoteTabInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChecknoteTabInfoImplToJson(
      this,
    );
  }
}

abstract class _ChecknoteTabInfo implements ChecknoteTabInfo {
  const factory _ChecknoteTabInfo(
      {required final List<String> tabs,
      required final int activeIndex}) = _$ChecknoteTabInfoImpl;

  factory _ChecknoteTabInfo.fromJson(Map<String, dynamic> json) =
      _$ChecknoteTabInfoImpl.fromJson;

  @override
  List<String> get tabs;
  @override
  int get activeIndex;

  /// Create a copy of ChecknoteTabInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChecknoteTabInfoImplCopyWith<_$ChecknoteTabInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChecknoteStats _$ChecknoteStatsFromJson(Map<String, dynamic> json) {
  return _ChecknoteStats.fromJson(json);
}

/// @nodoc
mixin _$ChecknoteStats {
  int get totalViews => throw _privateConstructorUsedError;
  int get totalLikes => throw _privateConstructorUsedError;
  int get totalShares => throw _privateConstructorUsedError;
  double get completionRate => throw _privateConstructorUsedError;
  int get streakDays => throw _privateConstructorUsedError;

  /// Serializes this ChecknoteStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChecknoteStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChecknoteStatsCopyWith<ChecknoteStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChecknoteStatsCopyWith<$Res> {
  factory $ChecknoteStatsCopyWith(
          ChecknoteStats value, $Res Function(ChecknoteStats) then) =
      _$ChecknoteStatsCopyWithImpl<$Res, ChecknoteStats>;
  @useResult
  $Res call(
      {int totalViews,
      int totalLikes,
      int totalShares,
      double completionRate,
      int streakDays});
}

/// @nodoc
class _$ChecknoteStatsCopyWithImpl<$Res, $Val extends ChecknoteStats>
    implements $ChecknoteStatsCopyWith<$Res> {
  _$ChecknoteStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChecknoteStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalViews = null,
    Object? totalLikes = null,
    Object? totalShares = null,
    Object? completionRate = null,
    Object? streakDays = null,
  }) {
    return _then(_value.copyWith(
      totalViews: null == totalViews
          ? _value.totalViews
          : totalViews // ignore: cast_nullable_to_non_nullable
              as int,
      totalLikes: null == totalLikes
          ? _value.totalLikes
          : totalLikes // ignore: cast_nullable_to_non_nullable
              as int,
      totalShares: null == totalShares
          ? _value.totalShares
          : totalShares // ignore: cast_nullable_to_non_nullable
              as int,
      completionRate: null == completionRate
          ? _value.completionRate
          : completionRate // ignore: cast_nullable_to_non_nullable
              as double,
      streakDays: null == streakDays
          ? _value.streakDays
          : streakDays // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChecknoteStatsImplCopyWith<$Res>
    implements $ChecknoteStatsCopyWith<$Res> {
  factory _$$ChecknoteStatsImplCopyWith(_$ChecknoteStatsImpl value,
          $Res Function(_$ChecknoteStatsImpl) then) =
      __$$ChecknoteStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalViews,
      int totalLikes,
      int totalShares,
      double completionRate,
      int streakDays});
}

/// @nodoc
class __$$ChecknoteStatsImplCopyWithImpl<$Res>
    extends _$ChecknoteStatsCopyWithImpl<$Res, _$ChecknoteStatsImpl>
    implements _$$ChecknoteStatsImplCopyWith<$Res> {
  __$$ChecknoteStatsImplCopyWithImpl(
      _$ChecknoteStatsImpl _value, $Res Function(_$ChecknoteStatsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChecknoteStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalViews = null,
    Object? totalLikes = null,
    Object? totalShares = null,
    Object? completionRate = null,
    Object? streakDays = null,
  }) {
    return _then(_$ChecknoteStatsImpl(
      totalViews: null == totalViews
          ? _value.totalViews
          : totalViews // ignore: cast_nullable_to_non_nullable
              as int,
      totalLikes: null == totalLikes
          ? _value.totalLikes
          : totalLikes // ignore: cast_nullable_to_non_nullable
              as int,
      totalShares: null == totalShares
          ? _value.totalShares
          : totalShares // ignore: cast_nullable_to_non_nullable
              as int,
      completionRate: null == completionRate
          ? _value.completionRate
          : completionRate // ignore: cast_nullable_to_non_nullable
              as double,
      streakDays: null == streakDays
          ? _value.streakDays
          : streakDays // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChecknoteStatsImpl implements _ChecknoteStats {
  const _$ChecknoteStatsImpl(
      {required this.totalViews,
      required this.totalLikes,
      required this.totalShares,
      required this.completionRate,
      required this.streakDays});

  factory _$ChecknoteStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChecknoteStatsImplFromJson(json);

  @override
  final int totalViews;
  @override
  final int totalLikes;
  @override
  final int totalShares;
  @override
  final double completionRate;
  @override
  final int streakDays;

  @override
  String toString() {
    return 'ChecknoteStats(totalViews: $totalViews, totalLikes: $totalLikes, totalShares: $totalShares, completionRate: $completionRate, streakDays: $streakDays)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChecknoteStatsImpl &&
            (identical(other.totalViews, totalViews) ||
                other.totalViews == totalViews) &&
            (identical(other.totalLikes, totalLikes) ||
                other.totalLikes == totalLikes) &&
            (identical(other.totalShares, totalShares) ||
                other.totalShares == totalShares) &&
            (identical(other.completionRate, completionRate) ||
                other.completionRate == completionRate) &&
            (identical(other.streakDays, streakDays) ||
                other.streakDays == streakDays));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalViews, totalLikes,
      totalShares, completionRate, streakDays);

  /// Create a copy of ChecknoteStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChecknoteStatsImplCopyWith<_$ChecknoteStatsImpl> get copyWith =>
      __$$ChecknoteStatsImplCopyWithImpl<_$ChecknoteStatsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChecknoteStatsImplToJson(
      this,
    );
  }
}

abstract class _ChecknoteStats implements ChecknoteStats {
  const factory _ChecknoteStats(
      {required final int totalViews,
      required final int totalLikes,
      required final int totalShares,
      required final double completionRate,
      required final int streakDays}) = _$ChecknoteStatsImpl;

  factory _ChecknoteStats.fromJson(Map<String, dynamic> json) =
      _$ChecknoteStatsImpl.fromJson;

  @override
  int get totalViews;
  @override
  int get totalLikes;
  @override
  int get totalShares;
  @override
  double get completionRate;
  @override
  int get streakDays;

  /// Create a copy of ChecknoteStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChecknoteStatsImplCopyWith<_$ChecknoteStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
