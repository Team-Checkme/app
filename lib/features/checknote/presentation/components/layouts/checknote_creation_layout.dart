import 'package:app/constants/app_icons.dart';
import 'package:app/constants/app_images.dart';
import 'package:app/design_system/widgets/app_button.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_spacing.dart';
import '../../../../../constants/app_typography.dart';

/// 체크노트 생성 페이지의 공통 레이아웃
class ChecknoteCreationLayout extends StatelessWidget {
  final int currentStep;
  final String stepTitle;
  final String stepNumber;
  final String backgroundImgPath;
  final Widget child;
  final VoidCallback? onNext;

  const ChecknoteCreationLayout({
    super.key,
    required this.currentStep,
    required this.stepTitle,
    required this.backgroundImgPath,
    required this.stepNumber,
    required this.child,
    this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue200,
      appBar: AppBar(
        elevation: 0,
        shadowColor: Colors.transparent, // 모든 그림자 색 제거
        surfaceTintColor: Colors.transparent, // Material 3 음영 제거
        centerTitle: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: AppSpacing.s16),
          child: InkWell(
            borderRadius: BorderRadius.circular(AppSpacing.s8),
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              AppIcons.arrowLeftOutline,
              width: 24,
              height: 24,
              colorFilter:
                  const ColorFilter.mode(AppColors.gray800, BlendMode.srcIn),
            ),
          ),
        ),
        titleSpacing: 4, // 기본 16 → 0~8 사이 추천
        leadingWidth: 44, // 기본 56 → 40~48 사이 추천(접근성 고려)
        title: Text(
          "체크 노트 만들기",
          style: AppTypography.heading20EB.copyWith(
            color: AppColors.gray900,
          ),
        ),
        backgroundColor: AppColors.blue200,
      ),
      body:
          // 메인 콘텐츠
          ColoredBox(
        color: AppColors.white,
        child: Column(
          children: [
            // 상단 가이드 섹션
            _buildGuideSection(),
            // 메인 폼 섹션
            _buildContentSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildGuideSection() {
    return ColoredBox(
      color: AppColors.blue200,
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          Positioned(child: _buildBackgroundImage(), bottom: 0, right: 0),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.s24),
            child: Column(
              children: [
                _buildStepIndicatorBar(currentStep, currentStep >= 0),
                const SizedBox(height: 15),
                _buildTitleSection()
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildContentSection() {
    return Expanded(
      child: ColoredBox(
        color: AppColors.blue200,
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppSpacing.s16),
              topRight: Radius.circular(AppSpacing.s16),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.s24),
            child: child,
            // child: Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Expanded(child: child),
            //   ],
            // ),
          ),
        ),
      ),
    );
  }

  Widget _buildStepIndicatorBar(int step, bool isCompleted) {
    const int lastStepLineLength = 215;
    const int normalStepLineLength = 24;

    final bool isFirstStep = step == 0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildStepIndicator(0, currentStep == 0),
        const SizedBox(width: 2),
        _buildStepLine(isFirstStep ? lastStepLineLength : normalStepLineLength),
        const SizedBox(width: 2),
        _buildStepIndicator(1, currentStep == 1),
        const SizedBox(width: 2),
        _buildStepLine(isFirstStep ? normalStepLineLength : lastStepLineLength),
        const SizedBox(width: 2),
        _buildStepIndicator(2, currentStep == 2),
      ],
    );
  }

  Widget _buildTitleSection() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            stepNumber,
            style: AppTypography.body14EB.copyWith(
              color: AppColors.blue600,
            ),
          ),
          const SizedBox(height: AppSpacing.s4),
          Text(
            stepTitle,
            style: AppTypography.heading20EB.copyWith(
              color: AppColors.gray900,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepIndicator(int step, bool isCurrentStep) {
    return Container(
      width: isCurrentStep ? AppSpacing.s32 : AppSpacing.s24,
      height: isCurrentStep ? AppSpacing.s32 : AppSpacing.s24,
      decoration: BoxDecoration(
        color: isCurrentStep ? AppColors.blue300 : Colors.transparent,
        borderRadius:
            BorderRadius.circular(step == 0 ? AppSpacing.s16 : AppSpacing.s12),
      ),
      child: SvgPicture.asset(
        AppIcons.checkCircleFilled,
        colorFilter: ColorFilter.mode(
          isCurrentStep ? AppColors.blue400 : AppColors.blue300,
          BlendMode.srcIn,
        ),
        width: step == 0 ? 26 : 19.5,
        height: step == 0 ? 26 : 19.5,
      ),
    );
  }

  Widget _buildStepLine(int flex) {
    return Expanded(
        flex: flex,
        child: const DottedLine(
          dashColor: AppColors.blue300,
        ));
  }

  Widget _buildBackgroundImage() {
    return Image.asset(_getBackgroundImage(), width: 200, height: 144);
  }

  String _getBackgroundImage() {
    switch (currentStep) {
      case 0:
        return AppImages.checknoteCreationStep1;
      case 1:
        return AppImages.checknoteCreationStep2;
      case 2:
        return AppImages.checknoteCreationStep3;
      default:
        return AppImages.checknoteCreationStep1;
    }
  }
}
