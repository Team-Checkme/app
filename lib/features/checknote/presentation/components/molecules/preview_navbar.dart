import 'package:flutter/material.dart';
import 'package:app/constants/app_colors.dart';
import 'package:app/constants/app_typography.dart';

class PreviewNavbar extends StatelessWidget {
  const PreviewNavbar({
    super.key,
    required this.onBack,
    this.title = '미리보기',
  });

  final VoidCallback onBack;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: AppColors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 32,
            height: 40,
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: onBack,
              icon: const Icon(Icons.arrow_back_ios_new,
                  size: 18, color: AppColors.gray900),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                title,
                style:
                    AppTypography.body16EB.copyWith(color: AppColors.gray900),
              ),
            ),
          ),
          const SizedBox(width: 32, height: 40),
        ],
      ),
    );
  }
}
