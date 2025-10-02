import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../constants/app_colors.dart';
import '../constants/app_icons.dart';
import '../constants/app_typography.dart';
import '../constants/app_spacing.dart';
import '../design_system/widgets/app_button.dart';
import '../features/checknote/presentation/pages/checknote_list_page.dart';
import '../features/checknote/presentation/pages/checknote_create_page.dart';

/// 메인 화면 - 앱의 진입점
class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          'Checkme',
          style: AppTypography.heading20EB.copyWith(
            color: AppColors.gray900,
          ),
        ),
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.s24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 앱 로고나 타이틀 영역
            _buildHeader(),
            const SizedBox(height: AppSpacing.s40),

            // 체크노트 관련 버튼들
            _buildChecknoteSection(context),
          ],
        ),
      ),
    );
  }

  /// 헤더 영역 빌드
  Widget _buildHeader() {
    return Column(
      children: [
        Text(
          '체크노트로 목표를 달성하세요',
          style: AppTypography.body16M.copyWith(
            color: AppColors.gray600,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  /// 체크노트 관련 버튼 섹션 빌드
  Widget _buildChecknoteSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // 내 체크노트 버튼
        AppButtonX.primary(
          text: '내 체크노트',
          icon: SvgPicture.asset(
            AppIcons.starFilled,
            width: 16,
            height: 16,
            colorFilter: const ColorFilter.mode(
              AppColors.white,
              BlendMode.srcIn,
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ChecknoteListPage(),
              ),
            );
          },
        ),

        const SizedBox(height: AppSpacing.s16),

        // 체크노트 만들기 버튼
        AppButtonX.secondaryA(
          text: '체크노트 만들기',
          icon: SvgPicture.asset(
            AppIcons.plusOutline,
            width: 16,
            height: 16,
            colorFilter: const ColorFilter.mode(
              AppColors.white,
              BlendMode.srcIn,
            ),
          ),
          onPressed: () {
            _showCreateChecknoteOptions(context);
          },
        ),

        const SizedBox(height: AppSpacing.s16),

        // 체크노트 참여하기 버튼
        AppButtonX.text(
          text: '체크노트 참여하기',
          icon: SvgPicture.asset(
            AppIcons.fireOutline,
            width: 16,
            height: 16,
            colorFilter: const ColorFilter.mode(
              AppColors.gray600,
              BlendMode.srcIn,
            ),
          ),
          textColor: AppColors.gray600,
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('체크노트 참여하기 기능은 준비 중입니다.'),
              ),
            );
          },
        ),
      ],
    );
  }

  /// 체크노트 만들기 옵션 표시
  void _showCreateChecknoteOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(AppSpacing.s24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 핸들바
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.gray300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            const SizedBox(height: AppSpacing.s24),

            Text(
              '체크노트 만들기',
              style: AppTypography.body16EB.copyWith(
                color: AppColors.gray900,
              ),
            ),

            const SizedBox(height: AppSpacing.s8),

            Text(
              '어떤 종류의 체크노트를 만들까요?',
              style: AppTypography.body14M.copyWith(
                color: AppColors.gray600,
              ),
            ),

            const SizedBox(height: AppSpacing.s24),

            // 싱글 체크노트 만들기
            AppButtonX.primary(
              text: '싱글 체크노트 만들기',
              icon: SvgPicture.asset(
                AppIcons.checkOutline,
                width: 16,
                height: 16,
                colorFilter: const ColorFilter.mode(
                  AppColors.white,
                  BlendMode.srcIn,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChecknoteCreatePage(),
                  ),
                );
              },
            ),

            const SizedBox(height: AppSpacing.s12),

            // 멀티 체크노트 만들기
            AppButtonX.secondaryA(
              text: '멀티 체크노트 만들기',
              icon: SvgPicture.asset(
                AppIcons.checkOutline,
                width: 16,
                height: 16,
                colorFilter: const ColorFilter.mode(
                  AppColors.white,
                  BlendMode.srcIn,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChecknoteCreatePage(),
                  ),
                );
              },
            ),

            const SizedBox(height: AppSpacing.s16),

            // 취소 버튼
            AppButtonX.text(
              text: '취소',
              textColor: AppColors.gray500,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
