import 'package:freezed_annotation/freezed_annotation.dart';
import 'checknote_entity.dart';

part 'checknote_detail_entity.freezed.dart';
part 'checknote_detail_entity.g.dart';

/// 체크노트 상세 정보 엔티티
@freezed
class ChecknoteDetailEntity with _$ChecknoteDetailEntity {
  const factory ChecknoteDetailEntity({
    required String id,
    required String title,
    required List<String> hashtags,
    required String description,
    required List<String> imageUrls,
    required ChecknoteType type,
    required ChecknoteStatus status,
    required ChecknoteMasterInfo master,
    required ChecknoteParticipantInfo participants,
    required ChecknoteCheckInfo checkInfo,
    required List<ChecknoteCheckItem> checkItems,
    required ChecknoteAccordionInfo accordionInfo,
    required ChecknoteTabInfo tabInfo,
    required ChecknoteStats stats,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ChecknoteDetailEntity;

  factory ChecknoteDetailEntity.fromJson(Map<String, dynamic> json) =>
      _$ChecknoteDetailEntityFromJson(json);
}

/// 체크노트 마스터 정보
@freezed
class ChecknoteMasterInfo with _$ChecknoteMasterInfo {
  const factory ChecknoteMasterInfo({
    required String id,
    required String name,
    required String? profileImageUrl,
    required String? bio,
  }) = _ChecknoteMasterInfo;

  factory ChecknoteMasterInfo.fromJson(Map<String, dynamic> json) =>
      _$ChecknoteMasterInfoFromJson(json);
}

/// 체크노트 참여자 정보
@freezed
class ChecknoteParticipantInfo with _$ChecknoteParticipantInfo {
  const factory ChecknoteParticipantInfo({
    required int currentCount,
    required int maxCount,
    required List<ChecknoteParticipant> participants,
  }) = _ChecknoteParticipantInfo;

  factory ChecknoteParticipantInfo.fromJson(Map<String, dynamic> json) =>
      _$ChecknoteParticipantInfoFromJson(json);
}

/// 체크노트 참여자
@freezed
class ChecknoteParticipant with _$ChecknoteParticipant {
  const factory ChecknoteParticipant({
    required String id,
    required String name,
    required String? profileImageUrl,
    required ChecknoteParticipantStatus status,
    required DateTime joinedAt,
  }) = _ChecknoteParticipant;

  factory ChecknoteParticipant.fromJson(Map<String, dynamic> json) =>
      _$ChecknoteParticipantFromJson(json);
}

/// 체크노트 체크 정보
@freezed
class ChecknoteCheckInfo with _$ChecknoteCheckInfo {
  const factory ChecknoteCheckInfo({
    required int currentCount,
    required int totalCount,
    required DateTime? lastCheckAt,
    required ChecknoteCheckSchedule? schedule,
  }) = _ChecknoteCheckInfo;

  factory ChecknoteCheckInfo.fromJson(Map<String, dynamic> json) =>
      _$ChecknoteCheckInfoFromJson(json);
}

/// 체크노트 체크 아이템
@freezed
class ChecknoteCheckItem with _$ChecknoteCheckItem {
  const factory ChecknoteCheckItem({
    required String id,
    required String title,
    required String description,
    required ChecknoteCheckItemColor color,
    required bool isCompleted,
    required bool isAvailable,
    required ChecknoteCheckSchedule? schedule,
    required ChecknoteCheckTime? time,
    required String? checkSchedule,
    required String? remainingTime,
    required DateTime? completedAt,
  }) = _ChecknoteCheckItem;

  factory ChecknoteCheckItem.fromJson(Map<String, dynamic> json) =>
      _$ChecknoteCheckItemFromJson(json);
}

/// 체크노트 체크 스케줄
@freezed
class ChecknoteCheckSchedule with _$ChecknoteCheckSchedule {
  const factory ChecknoteCheckSchedule({
    required ChecknoteScheduleType type,
    required int frequency,
    required List<int> daysOfWeek, // 0=일요일, 1=월요일, ...
    required ChecknoteCheckTime? timeRange,
  }) = _ChecknoteCheckSchedule;

  factory ChecknoteCheckSchedule.fromJson(Map<String, dynamic> json) =>
      _$ChecknoteCheckScheduleFromJson(json);
}

/// 체크노트 체크 시간
@freezed
class ChecknoteCheckTime with _$ChecknoteCheckTime {
  const factory ChecknoteCheckTime({
    required String startTime, // "22:00"
    required String endTime, // "23:00"
  }) = _ChecknoteCheckTime;

  factory ChecknoteCheckTime.fromJson(Map<String, dynamic> json) =>
      _$ChecknoteCheckTimeFromJson(json);
}

/// 체크노트 아코디언 정보
@freezed
class ChecknoteAccordionInfo with _$ChecknoteAccordionInfo {
  const factory ChecknoteAccordionInfo({
    required String title,
    required String content,
    required List<String> images,
    required bool isExpanded,
  }) = _ChecknoteAccordionInfo;

  factory ChecknoteAccordionInfo.fromJson(Map<String, dynamic> json) =>
      _$ChecknoteAccordionInfoFromJson(json);
}

/// 체크노트 탭 정보
@freezed
class ChecknoteTabInfo with _$ChecknoteTabInfo {
  const factory ChecknoteTabInfo({
    required List<String> tabs,
    required int activeIndex,
  }) = _ChecknoteTabInfo;

  factory ChecknoteTabInfo.fromJson(Map<String, dynamic> json) =>
      _$ChecknoteTabInfoFromJson(json);
}

/// 체크노트 통계 정보
@freezed
class ChecknoteStats with _$ChecknoteStats {
  const factory ChecknoteStats({
    required int totalViews,
    required int totalLikes,
    required int totalShares,
    required double completionRate,
    required int streakDays,
  }) = _ChecknoteStats;

  factory ChecknoteStats.fromJson(Map<String, dynamic> json) =>
      _$ChecknoteStatsFromJson(json);
}

/// 체크노트 체크 아이템 색상
enum ChecknoteCheckItemColor {
  check01,
  check02,
  check03,
  check04,
  check05,
  check06,
  check07,
  check08,
  check09,
  check10,
}

/// ChecknoteCheckItemColor 확장 메서드
extension ChecknoteCheckItemColorExtension on ChecknoteCheckItemColor {
  /// 인덱스에 따라 체크리스트 색상 반환 (6개를 넘어가면 반복)
  static ChecknoteCheckItemColor fromIndex(int index) {
    const colors = ChecknoteCheckItemColor.values;
    return colors[index % 6]; // check01~check06만 반복
  }
}

/// 체크노트 참여자 상태
enum ChecknoteParticipantStatus {
  active,
  pending,
  suspended,
  left,
}

/// 체크노트 스케줄 타입
enum ChecknoteScheduleType {
  daily,
  weekly,
  monthly,
  custom,
}

/// 체크노트 상태
enum ChecknoteStatus {
  draft,
  active,
  paused,
  completed,
  archived,
}
