import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_icons.dart';
import '../../../../../constants/app_typography.dart';
import '../../../../../constants/app_spacing.dart';

/// 체크노트 리스트 페이지의 앱바
/// 뒤로가기, 제목, 검색/알림 아이콘을 포함
class ChecknoteListAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ChecknoteListAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.white,
      surfaceTintColor: Colors.transparent,
      leadingWidth: 56, // 뒤로가기 버튼 너비
      leading: Padding(
        padding: const EdgeInsets.only(left: AppSpacing.s16),
        child: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset(
            AppIcons.arrowLeftOutline,
            width: 24,
            height: 24,
            colorFilter: const ColorFilter.mode(
              AppColors.gray800,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
      title: Text(
        '내 체크 노트',
        style: AppTypography.heading20EB.copyWith(
          color: AppColors.gray900,
        ),
      ),
      centerTitle: false,
      titleSpacing: 4,
      actions: [
        // 검색 버튼
        Padding(
          padding: const EdgeInsets.only(right: AppSpacing.s4),
          child: IconButton(
            onPressed: () {
              // 검색 기능 구현
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('검색 기능은 준비 중입니다.')),
              );
            },
            icon: SvgPicture.asset(
              AppIcons.searchOutline,
              width: 24,
              height: 24,
              colorFilter: const ColorFilter.mode(
                AppColors.gray800,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        // 알림 버튼
        Padding(
          padding: const EdgeInsets.only(right: AppSpacing.s16),
          child: IconButton(
            onPressed: () {
              // 알림 기능 구현
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('알림 기능은 준비 중입니다.')),
              );
            },
            icon: SvgPicture.asset(
              AppIcons.alarmOutline,
              width: 24,
              height: 24,
              colorFilter: const ColorFilter.mode(
                AppColors.gray800,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
