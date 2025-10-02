import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_icons.dart';
import '../../../../../constants/app_images.dart';
import '../../../../../constants/app_spacing.dart';
import '../../../../../constants/app_typography.dart';
import '../../../../../design_system/widgets/app_button.dart';

/// 체크노트가 없을 때 보여주는 빈 상태 컴포넌트
/// 일러스트레이션, 안내 텍스트, 액션 버튼들을 포함
class ChecknoteEmptyState extends StatelessWidget {
  const ChecknoteEmptyState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.gray100,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.s40,
        vertical: AppSpacing.s40,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 일러스트레이션
          _buildIllustration(),

          const SizedBox(height: AppSpacing.s16),

          // 안내 텍스트
          _buildGuideText(),

          const SizedBox(height: AppSpacing.s24),

          // 액션 버튼들
          _buildActionButtons(context),
        ],
      ),
    );
  }

  /// 일러스트레이션 위젯 빌드
  Widget _buildIllustration() {
    return SizedBox(
      width: 192,
      height: 165,
      child: Stack(
        children: [
          // 배경 일러스트레이션 (SVG로 대체 가능)
          Container(
            width: 192,
            height: 165,
            decoration: BoxDecoration(
              color: AppColors.gray100,
              borderRadius: BorderRadius.circular(AppSpacing.s16),
            ),
            child: Image.asset(AppImages.myChecknoteListEmpty),
          ),
        ],
      ),
    );
  }

  /// 안내 텍스트 위젯 빌드
  Widget _buildGuideText() {
    return Text(
      '체크 노트를 만들고, 참여해 보세요.',
      style: AppTypography.body16M.copyWith(
        color: AppColors.gray900,
      ),
      textAlign: TextAlign.center,
    );
  }

  /// 액션 버튼들 위젯 빌드
  Widget _buildActionButtons(BuildContext context) {
    return Column(
      children: [
        // 체크 노트 만들기 버튼
        SizedBox(
          width: double.infinity,
          child: AppButtonX.primary(
            height: 48,
            text: '체크 노트 만들기',
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
              // 체크노트 생성 페이지로 이동
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('체크노트 만들기 기능은 준비 중입니다.')),
              );
            },
          ),
        ),

        const SizedBox(height: AppSpacing.s8),

        // 체크 노트 참여하기 버튼
        SizedBox(
          width: double.infinity,
          child: AppButtonX.text(
            height: 48,
            text: '체크 노트 참여하기',
            icon: SvgPicture.asset(
              AppIcons.fireOutline,
              width: 16,
              height: 16,
              colorFilter: const ColorFilter.mode(
                AppColors.gray600,
                BlendMode.srcIn,
              ),
            ),
            onPressed: () {
              // 체크노트 참여 페이지로 이동
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('체크노트 참여하기 기능은 준비 중입니다.')),
              );
            },
          ),
        ),
      ],
    );
  }
}
