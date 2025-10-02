import 'package:app/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:app/constants/app_colors.dart';
import 'package:app/constants/app_typography.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// 라벨 태그 컴포넌트
/// - "마스터", "싱글" 등의 상태 표시
/// - 아이콘과 텍스트를 함께 표시할 수 있음
class LabelTag extends StatelessWidget {
  const LabelTag({
    super.key,
    required this.text,
    this.icon,
    this.backgroundColor = AppColors.blue200,
    this.textColor = AppColors.blue700,
    this.iconColor,
    this.padding = const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
    this.borderRadius = 4,
    this.gap = 4,
  });

  /// 태그 텍스트
  final String text;

  /// 아이콘 (선택사항)
  final Widget? icon;

  /// 배경색
  final Color backgroundColor;

  /// 텍스트 색상
  final Color textColor;

  /// 아이콘 색상 (null이면 textColor와 동일)
  final Color? iconColor;

  /// 내부 패딩
  final EdgeInsets padding;

  /// 모서리 둥글기
  final double borderRadius;

  /// 아이콘과 텍스트 사이 간격
  final double gap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            IconTheme(
              data: IconThemeData(
                color: iconColor ?? textColor,
                size: 16,
              ),
              child: icon!,
            ),
            if (gap > 0) SizedBox(width: gap),
          ],
          Text(
            text,
            style: AppTypography.caption12EB.copyWith(
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}

/// 라벨 태그 변형들
class LabelTagVariants {
  /// 마스터 태그
  static LabelTag master({
    Key? key,
    String text = '마스터',
    Widget? icon,
  }) {
    return LabelTag(
      key: key,
      text: text,
      icon: icon ??
          SvgPicture.asset(
            AppIcons.crownFilled,
            width: 16,
            height: 16,
            colorFilter:
                const ColorFilter.mode(AppColors.blue500, BlendMode.srcIn),
          ),
      backgroundColor: AppColors.blue200,
      textColor: AppColors.blue500,
    );
  }

  /// 싱글 태그
  static LabelTag single({
    Key? key,
    String text = '싱글',
  }) {
    return LabelTag(
      key: key,
      text: text,
      backgroundColor: Colors.transparent,
      textColor: AppColors.blue500,
    );
  }

  /// 멀티 태그
  static LabelTag multi({
    Key? key,
    String text = '멀티',
  }) {
    return LabelTag(
      key: key,
      text: text,
      backgroundColor: Colors.transparent,
      textColor: AppColors.blue500,
    );
  }

  /// 참여중 태그
  static LabelTag participating({
    Key? key,
    String text = '참여중',
    Widget? icon,
  }) {
    return LabelTag(
      key: key,
      text: text,
      icon: icon ??
          SvgPicture.asset(
            AppIcons.fireFilled,
            width: 16,
            height: 16,
            colorFilter:
                const ColorFilter.mode(AppColors.blue500, BlendMode.srcIn),
          ),
      backgroundColor: AppColors.blue200,
      textColor: AppColors.blue500,
    );
  }
}
