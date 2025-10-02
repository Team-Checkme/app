import 'package:flutter/material.dart';
import 'package:app/constants/app_colors.dart';
import 'package:app/constants/app_spacing.dart';
import 'package:app/design_system/widgets/app_button.dart';

class PreviewBottomActions extends StatelessWidget {
  const PreviewBottomActions({
    super.key,
    required this.onPrevious,
    required this.onCreate,
  });

  final VoidCallback onPrevious;
  final VoidCallback onCreate;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.s16),
      child: Row(
        children: [
          Expanded(
            child: AppButton(
              type: ButtonType.secondaryB,
              text: '이전',
              height: 48,
              onPressed: onPrevious,
            ),
          ),
          const SizedBox(width: AppSpacing.s8),
          Expanded(
            child: AppButton(
              type: ButtonType.primary,
              text: '생성하기',
              height: 48,
              onPressed: onCreate,
            ),
          ),
        ],
      ),
    );
  }
}
