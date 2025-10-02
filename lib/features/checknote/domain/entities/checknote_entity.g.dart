// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checknote_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChecknoteEntityImpl _$$ChecknoteEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$ChecknoteEntityImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrls:
          (json['imageUrls'] as List<dynamic>).map((e) => e as String).toList(),
      type: $enumDecode(_$ChecknoteTypeEnumMap, json['type']),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$ChecknoteEntityImplToJson(
        _$ChecknoteEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrls': instance.imageUrls,
      'type': _$ChecknoteTypeEnumMap[instance.type]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$ChecknoteTypeEnumMap = {
  ChecknoteType.single: 'single',
  ChecknoteType.multi: 'multi',
};
