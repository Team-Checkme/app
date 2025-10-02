import 'dart:ui';

import 'package:app/constants/app_colors.dart';
import 'package:app/features/checknote/domain/entities/checknote_detail_entity.dart';

/// 체크리스트 색상 유틸리티
class ChecklistColorUtils {
  ChecklistColorUtils._();

  /// 체크리스트 아이템 인덱스에 따라 자동으로 색상 적용
  /// - 0~5: check01~check06 순서대로
  /// - 6 이상: check01부터 다시 반복
  static ChecknoteCheckItemColor getColorByIndex(int index) {
    return ChecknoteCheckItemColorExtension.fromIndex(index);
  }

  /// 체크리스트 아이템 인덱스에 따라 자동으로 배경색 반환
  /// - 0~5: check01~check06 순서대로
  /// - 6 이상: check01부터 다시 반복
  static Color getBackgroundColorByIndex(int index) {
    return AppColors.getCheckColorByIndex(index);
  }

  /// 체크리스트 아이템 리스트에 자동으로 색상 적용
  /// 각 아이템의 인덱스에 따라 순서대로 색상이 적용됩니다.
  static List<ChecknoteCheckItem> applyColorsToCheckItems(
    List<ChecknoteCheckItem> items,
  ) {
    return items.asMap().entries.map((entry) {
      final index = entry.key;
      final item = entry.value;

      return item.copyWith(
        color: getColorByIndex(index),
      );
    }).toList();
  }

  /// 새로운 체크리스트 아이템 생성 시 자동으로 색상 적용
  static ChecknoteCheckItem createCheckItemWithAutoColor({
    required String id,
    required String title,
    required String description,
    required int itemIndex, // 아이템의 순서 인덱스
    required bool isCompleted,
    required bool isAvailable,
    ChecknoteCheckSchedule? schedule,
    ChecknoteCheckTime? time,
    String? checkSchedule,
    String? remainingTime,
    DateTime? completedAt,
  }) {
    return ChecknoteCheckItem(
      id: id,
      title: title,
      description: description,
      color: getColorByIndex(itemIndex), // 자동으로 색상 적용
      isCompleted: isCompleted,
      isAvailable: isAvailable,
      schedule: schedule,
      time: time,
      checkSchedule: checkSchedule,
      remainingTime: remainingTime,
      completedAt: completedAt,
    );
  }
}
