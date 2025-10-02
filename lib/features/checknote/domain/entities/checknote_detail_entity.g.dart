// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checknote_detail_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChecknoteDetailEntityImpl _$$ChecknoteDetailEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$ChecknoteDetailEntityImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      hashtags:
          (json['hashtags'] as List<dynamic>).map((e) => e as String).toList(),
      description: json['description'] as String,
      imageUrls:
          (json['imageUrls'] as List<dynamic>).map((e) => e as String).toList(),
      type: $enumDecode(_$ChecknoteTypeEnumMap, json['type']),
      status: $enumDecode(_$ChecknoteStatusEnumMap, json['status']),
      master:
          ChecknoteMasterInfo.fromJson(json['master'] as Map<String, dynamic>),
      participants: ChecknoteParticipantInfo.fromJson(
          json['participants'] as Map<String, dynamic>),
      checkInfo: ChecknoteCheckInfo.fromJson(
          json['checkInfo'] as Map<String, dynamic>),
      checkItems: (json['checkItems'] as List<dynamic>)
          .map((e) => ChecknoteCheckItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      accordionInfo: ChecknoteAccordionInfo.fromJson(
          json['accordionInfo'] as Map<String, dynamic>),
      tabInfo:
          ChecknoteTabInfo.fromJson(json['tabInfo'] as Map<String, dynamic>),
      stats: ChecknoteStats.fromJson(json['stats'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$ChecknoteDetailEntityImplToJson(
        _$ChecknoteDetailEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'hashtags': instance.hashtags,
      'description': instance.description,
      'imageUrls': instance.imageUrls,
      'type': _$ChecknoteTypeEnumMap[instance.type]!,
      'status': _$ChecknoteStatusEnumMap[instance.status]!,
      'master': instance.master,
      'participants': instance.participants,
      'checkInfo': instance.checkInfo,
      'checkItems': instance.checkItems,
      'accordionInfo': instance.accordionInfo,
      'tabInfo': instance.tabInfo,
      'stats': instance.stats,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$ChecknoteTypeEnumMap = {
  ChecknoteType.single: 'single',
  ChecknoteType.multi: 'multi',
};

const _$ChecknoteStatusEnumMap = {
  ChecknoteStatus.draft: 'draft',
  ChecknoteStatus.active: 'active',
  ChecknoteStatus.paused: 'paused',
  ChecknoteStatus.completed: 'completed',
  ChecknoteStatus.archived: 'archived',
};

_$ChecknoteMasterInfoImpl _$$ChecknoteMasterInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$ChecknoteMasterInfoImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      profileImageUrl: json['profileImageUrl'] as String?,
      bio: json['bio'] as String?,
    );

Map<String, dynamic> _$$ChecknoteMasterInfoImplToJson(
        _$ChecknoteMasterInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profileImageUrl': instance.profileImageUrl,
      'bio': instance.bio,
    };

_$ChecknoteParticipantInfoImpl _$$ChecknoteParticipantInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$ChecknoteParticipantInfoImpl(
      currentCount: (json['currentCount'] as num).toInt(),
      maxCount: (json['maxCount'] as num).toInt(),
      participants: (json['participants'] as List<dynamic>)
          .map((e) => ChecknoteParticipant.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ChecknoteParticipantInfoImplToJson(
        _$ChecknoteParticipantInfoImpl instance) =>
    <String, dynamic>{
      'currentCount': instance.currentCount,
      'maxCount': instance.maxCount,
      'participants': instance.participants,
    };

_$ChecknoteParticipantImpl _$$ChecknoteParticipantImplFromJson(
        Map<String, dynamic> json) =>
    _$ChecknoteParticipantImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      profileImageUrl: json['profileImageUrl'] as String?,
      status: $enumDecode(_$ChecknoteParticipantStatusEnumMap, json['status']),
      joinedAt: DateTime.parse(json['joinedAt'] as String),
    );

Map<String, dynamic> _$$ChecknoteParticipantImplToJson(
        _$ChecknoteParticipantImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profileImageUrl': instance.profileImageUrl,
      'status': _$ChecknoteParticipantStatusEnumMap[instance.status]!,
      'joinedAt': instance.joinedAt.toIso8601String(),
    };

const _$ChecknoteParticipantStatusEnumMap = {
  ChecknoteParticipantStatus.active: 'active',
  ChecknoteParticipantStatus.pending: 'pending',
  ChecknoteParticipantStatus.suspended: 'suspended',
  ChecknoteParticipantStatus.left: 'left',
};

_$ChecknoteCheckInfoImpl _$$ChecknoteCheckInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$ChecknoteCheckInfoImpl(
      currentCount: (json['currentCount'] as num).toInt(),
      totalCount: (json['totalCount'] as num).toInt(),
      lastCheckAt: json['lastCheckAt'] == null
          ? null
          : DateTime.parse(json['lastCheckAt'] as String),
      schedule: json['schedule'] == null
          ? null
          : ChecknoteCheckSchedule.fromJson(
              json['schedule'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ChecknoteCheckInfoImplToJson(
        _$ChecknoteCheckInfoImpl instance) =>
    <String, dynamic>{
      'currentCount': instance.currentCount,
      'totalCount': instance.totalCount,
      'lastCheckAt': instance.lastCheckAt?.toIso8601String(),
      'schedule': instance.schedule,
    };

_$ChecknoteCheckItemImpl _$$ChecknoteCheckItemImplFromJson(
        Map<String, dynamic> json) =>
    _$ChecknoteCheckItemImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      color: $enumDecode(_$ChecknoteCheckItemColorEnumMap, json['color']),
      isCompleted: json['isCompleted'] as bool,
      isAvailable: json['isAvailable'] as bool,
      schedule: json['schedule'] == null
          ? null
          : ChecknoteCheckSchedule.fromJson(
              json['schedule'] as Map<String, dynamic>),
      time: json['time'] == null
          ? null
          : ChecknoteCheckTime.fromJson(json['time'] as Map<String, dynamic>),
      checkSchedule: json['checkSchedule'] as String?,
      remainingTime: json['remainingTime'] as String?,
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
    );

Map<String, dynamic> _$$ChecknoteCheckItemImplToJson(
        _$ChecknoteCheckItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'color': _$ChecknoteCheckItemColorEnumMap[instance.color]!,
      'isCompleted': instance.isCompleted,
      'isAvailable': instance.isAvailable,
      'schedule': instance.schedule,
      'time': instance.time,
      'checkSchedule': instance.checkSchedule,
      'remainingTime': instance.remainingTime,
      'completedAt': instance.completedAt?.toIso8601String(),
    };

const _$ChecknoteCheckItemColorEnumMap = {
  ChecknoteCheckItemColor.check01: 'check01',
  ChecknoteCheckItemColor.check02: 'check02',
  ChecknoteCheckItemColor.check03: 'check03',
  ChecknoteCheckItemColor.check04: 'check04',
  ChecknoteCheckItemColor.check05: 'check05',
  ChecknoteCheckItemColor.check06: 'check06',
  ChecknoteCheckItemColor.check07: 'check07',
  ChecknoteCheckItemColor.check08: 'check08',
  ChecknoteCheckItemColor.check09: 'check09',
  ChecknoteCheckItemColor.check10: 'check10',
};

_$ChecknoteCheckScheduleImpl _$$ChecknoteCheckScheduleImplFromJson(
        Map<String, dynamic> json) =>
    _$ChecknoteCheckScheduleImpl(
      type: $enumDecode(_$ChecknoteScheduleTypeEnumMap, json['type']),
      frequency: (json['frequency'] as num).toInt(),
      daysOfWeek: (json['daysOfWeek'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      timeRange: json['timeRange'] == null
          ? null
          : ChecknoteCheckTime.fromJson(
              json['timeRange'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ChecknoteCheckScheduleImplToJson(
        _$ChecknoteCheckScheduleImpl instance) =>
    <String, dynamic>{
      'type': _$ChecknoteScheduleTypeEnumMap[instance.type]!,
      'frequency': instance.frequency,
      'daysOfWeek': instance.daysOfWeek,
      'timeRange': instance.timeRange,
    };

const _$ChecknoteScheduleTypeEnumMap = {
  ChecknoteScheduleType.daily: 'daily',
  ChecknoteScheduleType.weekly: 'weekly',
  ChecknoteScheduleType.monthly: 'monthly',
  ChecknoteScheduleType.custom: 'custom',
};

_$ChecknoteCheckTimeImpl _$$ChecknoteCheckTimeImplFromJson(
        Map<String, dynamic> json) =>
    _$ChecknoteCheckTimeImpl(
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
    );

Map<String, dynamic> _$$ChecknoteCheckTimeImplToJson(
        _$ChecknoteCheckTimeImpl instance) =>
    <String, dynamic>{
      'startTime': instance.startTime,
      'endTime': instance.endTime,
    };

_$ChecknoteAccordionInfoImpl _$$ChecknoteAccordionInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$ChecknoteAccordionInfoImpl(
      title: json['title'] as String,
      content: json['content'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      isExpanded: json['isExpanded'] as bool,
    );

Map<String, dynamic> _$$ChecknoteAccordionInfoImplToJson(
        _$ChecknoteAccordionInfoImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'images': instance.images,
      'isExpanded': instance.isExpanded,
    };

_$ChecknoteTabInfoImpl _$$ChecknoteTabInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$ChecknoteTabInfoImpl(
      tabs: (json['tabs'] as List<dynamic>).map((e) => e as String).toList(),
      activeIndex: (json['activeIndex'] as num).toInt(),
    );

Map<String, dynamic> _$$ChecknoteTabInfoImplToJson(
        _$ChecknoteTabInfoImpl instance) =>
    <String, dynamic>{
      'tabs': instance.tabs,
      'activeIndex': instance.activeIndex,
    };

_$ChecknoteStatsImpl _$$ChecknoteStatsImplFromJson(Map<String, dynamic> json) =>
    _$ChecknoteStatsImpl(
      totalViews: (json['totalViews'] as num).toInt(),
      totalLikes: (json['totalLikes'] as num).toInt(),
      totalShares: (json['totalShares'] as num).toInt(),
      completionRate: (json['completionRate'] as num).toDouble(),
      streakDays: (json['streakDays'] as num).toInt(),
    );

Map<String, dynamic> _$$ChecknoteStatsImplToJson(
        _$ChecknoteStatsImpl instance) =>
    <String, dynamic>{
      'totalViews': instance.totalViews,
      'totalLikes': instance.totalLikes,
      'totalShares': instance.totalShares,
      'completionRate': instance.completionRate,
      'streakDays': instance.streakDays,
    };
