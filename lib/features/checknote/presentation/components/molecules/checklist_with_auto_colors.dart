import 'package:flutter/material.dart';
import 'package:app/constants/app_colors.dart';
import 'package:app/constants/app_typography.dart';
import 'package:app/constants/app_spacing.dart';
import 'package:app/utils/checklist_color_utils.dart';

/// 자동으로 색상이 적용되는 체크리스트 컴포넌트
class ChecklistWithAutoColors extends StatelessWidget {
  const ChecklistWithAutoColors({
    super.key,
    required this.checkItems,
    this.onItemTap,
    this.onItemCheck,
  });

  final List<String> checkItems;
  final void Function(int index)? onItemTap;
  final void Function(int index)? onItemCheck;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 제목
        Text(
          '체크리스트',
          style: AppTypography.body16EB.copyWith(
            color: AppColors.gray900,
          ),
        ),
        const SizedBox(height: AppSpacing.s16),

        // 체크리스트 아이템들 (자동으로 색상 적용)
        ...checkItems.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;

          return Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.s12),
            child: GestureDetector(
              onTap: () => onItemTap?.call(index),
              child: Container(
                padding: const EdgeInsets.all(AppSpacing.s16),
                decoration: BoxDecoration(
                  // 자동으로 인덱스에 따라 색상 적용
                  color: ChecklistColorUtils.getBackgroundColorByIndex(index),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppColors.gray200,
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    // 체크박스
                    GestureDetector(
                      onTap: () => onItemCheck?.call(index),
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: AppColors.gray300,
                            width: 1,
                          ),
                        ),
                        child: const Icon(
                          Icons.check,
                          size: 16,
                          color: AppColors.gray900,
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.s12),

                    // 체크리스트 텍스트
                    Expanded(
                      child: Text(
                        item,
                        style: AppTypography.body14M.copyWith(
                          color: AppColors.gray900,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ],
    );
  }
}

/// 체크리스트 색상 미리보기 컴포넌트
class ChecklistColorPreview extends StatelessWidget {
  const ChecklistColorPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '체크리스트 색상 미리보기',
          style: AppTypography.body16EB.copyWith(
            color: AppColors.gray900,
          ),
        ),
        const SizedBox(height: AppSpacing.s16),

        // 12개의 색상 미리보기 (6개 반복)
        ...List.generate(12, (index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.s8),
            child: Container(
              padding: const EdgeInsets.all(AppSpacing.s16),
              decoration: BoxDecoration(
                color: ChecklistColorUtils.getBackgroundColorByIndex(index),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const SizedBox.shrink(),
            ),
          );
        }),
      ],
    );
  }
}
