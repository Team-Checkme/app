import 'package:flutter/material.dart';
import 'package:app/constants/app_colors.dart';
import 'package:app/constants/app_typography.dart';
import 'package:app/constants/app_spacing.dart';

class PreviewTabMenu extends StatelessWidget {
  const PreviewTabMenu({
    super.key,
    required this.tabs,
    required this.activeIndex,
    required this.onChanged,
  });

  final List<String> tabs;
  final int activeIndex;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            for (int i = 0; i < tabs.length; i++)
              Expanded(
                child: InkWell(
                  onTap: () => onChanged(i),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: AppSpacing.s8, horizontal: AppSpacing.s16),
                    child: Column(
                      children: [
                        Text(
                          tabs[i],
                          style: (i == activeIndex
                                  ? AppTypography.body14B
                                  : AppTypography.body14M)
                              .copyWith(
                                  color: i == activeIndex
                                      ? AppColors.gray900
                                      : AppColors.gray700),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
        Container(
          height: 1,
          color: AppColors.gray200,
          margin: const EdgeInsets.only(top: 39),
        ),
      ],
    );
  }
}
