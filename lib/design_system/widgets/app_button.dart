import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_typography.dart';

/// Button 타입 정의
enum ButtonType {
  primary, // 파란색 배경, 흰색 텍스트
  secondaryA, // 진한 회색 배경, 흰색 텍스트
  secondaryB, // 연한 회색 배경, 검은색 텍스트
  text, // 투명 배경, 회색 텍스트, 테두리만
}

/// 서브 텍스트 정렬 방식
enum SubTextAlignment {
  vertical, // 수직 정렬 (기본값)
  horizontal, // 수평 정렬
}

/// App 전체에서 사용하는 표준 버튼 컴포넌트
class AppButton extends StatelessWidget {
  // 최솟값 제약조건 (피그마 디자인 기준)
  static const double minWidth = 56.0; // 텍스트 버튼 최소 너비
  static const double minHeight = 40.0; // 모든 버튼 최소 높이

  // Padding 상수 (피그마 디자인 기준)
  static const EdgeInsets defaultPadding = EdgeInsets.symmetric(
    horizontal: 16.0, // 좌우 16px
    vertical: 8.0, // 상하 8px
  );

  // Gap 상수 (피그마 디자인 기준)
  static const double defaultGap = 4.0; // 요소들 사이 4px

  // Border Radius
  static const double borderRadius = 8.0; // 모든 버튼 8px

  final ButtonType type;
  final String text;
  final Widget? icon;
  final String? subText;
  final SubTextAlignment subTextAlignment;
  final VoidCallback? onPressed;
  final bool isLoading;
  final double? width;
  final double? height;
  final bool expand;
  final Color? textColor;

  const AppButton({
    super.key,
    required this.type,
    required this.text,
    this.icon,
    this.subText,
    this.subTextAlignment = SubTextAlignment.vertical,
    this.onPressed,
    this.isLoading = false,
    this.width,
    this.height,
    this.expand = false,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final isDisabled = onPressed == null;

    return Container(
      constraints: BoxConstraints(
        minWidth: width ?? minWidth,
        minHeight: height ?? minHeight,
      ),
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: isDisabled ? null : onPressed,
        style: _buildButtonStyle(),
        child: _buildContent(),
      ),
    );
  }

  /// 버튼 스타일 생성
  ButtonStyle _buildButtonStyle() {
    return ButtonStyle(
      splashFactory: NoSplash.splashFactory,
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return AppColors.gray300;
        }
        if (states.contains(WidgetState.pressed)) {
          // text 버튼은 배경색 변화 없음, primary는 0.6, 나머지는 0.8으로 연하게
          if (type == ButtonType.primary) {
            return _getBackgroundColor().withOpacity(0.6);
          } else if (type == ButtonType.text) {
            return _getBackgroundColor(); // 배경색 변화 없음
          } else {
            return _getBackgroundColor().withOpacity(0.8);
          }
        }
        return _getBackgroundColor();
      }),
      foregroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return AppColors.gray500; // 텍스트는 더 진한 회색으로
        }
        if (states.contains(WidgetState.pressed)) {
          // primary는 0.8, 나머지는 0.6으로 연하게
          if (type == ButtonType.primary) {
            return _getTextColor().withOpacity(0.6);
          } else {
            return _getTextColor().withOpacity(0.8);
          }
        }
        return _getTextColor();
      }),
      overlayColor: const WidgetStatePropertyAll(Colors.transparent),
      elevation: WidgetStateProperty.all(0.0),
      padding: WidgetStateProperty.all(defaultPadding),
      minimumSize: WidgetStateProperty.all(const Size(minWidth, minHeight)),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      side: WidgetStateProperty.resolveWith((states) {
        if (type == ButtonType.text) {
          return BorderSide(
            color: states.contains(WidgetState.disabled)
                ? AppColors.gray300
                : AppColors.gray200,
            width: 1,
          );
        }
        return null;
      }),
    );
  }

  /// 배경색 반환
  Color _getBackgroundColor() {
    switch (type) {
      case ButtonType.primary:
        return AppColors.gray900;
      case ButtonType.secondaryA:
        return AppColors.gray800;
      case ButtonType.secondaryB:
        return AppColors.gray200;
      case ButtonType.text:
        return AppColors.white;
    }
  }

  /// 텍스트 색상 반환
  Color _getTextColor() {
    // 외부에서 textColor가 제공되면 우선 사용
    if (textColor != null) {
      return textColor!;
    }

    switch (type) {
      case ButtonType.primary:
        return Colors.white;
      case ButtonType.secondaryA:
        return Colors.white;
      case ButtonType.secondaryB:
        return AppColors.gray900;
      case ButtonType.text:
        return AppColors.gray700;
    }
  }

  /// 버튼 내용 구성
  Widget _buildContent() {
    if (isLoading) {
      return const SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    }

    final hasIcon = icon != null;
    final hasSubText = subText != null;

    if (hasSubText) {
      if (subTextAlignment == SubTextAlignment.horizontal) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildMainContent(hasIcon),
            const SizedBox(width: 4),
            Text(
              subText!,
              style: AppTypography.caption12M.copyWith(
                color: _getSubTextColor(),
              ),
            ),
          ],
        );
      } else {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildMainContent(hasIcon),
            const SizedBox(height: 2),
            Text(
              subText!,
              style: AppTypography.caption12M.copyWith(
                color: _getSubTextColor(),
              ),
            ),
          ],
        );
      }
    } else {
      return _buildMainContent(hasIcon);
    }
  }

  /// 메인 콘텐츠 (아이콘 + 텍스트)
  Widget _buildMainContent(bool hasIcon) {
    if (hasIcon) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon!,
          const SizedBox(width: defaultGap),
          _buildText(),
        ],
      );
    } else {
      return _buildText();
    }
  }

  /// 텍스트 스타일
  Widget _buildText() {
    return Text(
      text,
      style: AppTypography.body14B,
      textAlign: TextAlign.center,
    );
  }

  /// 서브 텍스트 색상
  Color _getSubTextColor() {
    switch (type) {
      case ButtonType.primary:
      case ButtonType.secondaryA:
        return Colors.white.withOpacity(0.8);
      case ButtonType.secondaryB:
      case ButtonType.text:
        return AppColors.gray500;
    }
  }
}

/// 편의 메서드들을 위한 확장
extension AppButtonX on AppButton {
  /// Primary 버튼 생성
  static AppButton primary({
    Key? key,
    required String text,
    Widget? icon,
    String? subText,
    SubTextAlignment subTextAlignment = SubTextAlignment.vertical,
    VoidCallback? onPressed,
    bool isLoading = false,
    double? width,
    double? height,
    bool expand = false,
    Color? textColor,
  }) {
    return AppButton(
      key: key,
      type: ButtonType.primary,
      text: text,
      icon: icon,
      subText: subText,
      subTextAlignment: subTextAlignment,
      onPressed: onPressed,
      isLoading: isLoading,
      width: width,
      height: height,
      expand: expand,
      textColor: textColor,
    );
  }

  /// SecondaryA 버튼 생성
  static AppButton secondaryA({
    Key? key,
    required String text,
    Widget? icon,
    String? subText,
    SubTextAlignment subTextAlignment = SubTextAlignment.vertical,
    VoidCallback? onPressed,
    bool isLoading = false,
    double? width,
    double? height,
    bool expand = false,
    Color? textColor,
  }) {
    return AppButton(
      key: key,
      type: ButtonType.secondaryA,
      text: text,
      icon: icon,
      subText: subText,
      subTextAlignment: subTextAlignment,
      onPressed: onPressed,
      isLoading: isLoading,
      width: width,
      height: height,
      expand: expand,
      textColor: textColor,
    );
  }

  /// SecondaryB 버튼 생성
  static AppButton secondaryB({
    Key? key,
    required String text,
    Widget? icon,
    String? subText,
    SubTextAlignment subTextAlignment = SubTextAlignment.vertical,
    VoidCallback? onPressed,
    bool isLoading = false,
    double? width,
    double? height,
    bool expand = false,
    Color? textColor,
  }) {
    return AppButton(
      key: key,
      type: ButtonType.secondaryB,
      text: text,
      icon: icon,
      subText: subText,
      subTextAlignment: subTextAlignment,
      onPressed: onPressed,
      isLoading: isLoading,
      width: width,
      height: height,
      expand: expand,
      textColor: textColor,
    );
  }

  /// Text 버튼 생성
  static AppButton text({
    Key? key,
    required String text,
    Widget? icon,
    String? subText,
    SubTextAlignment subTextAlignment = SubTextAlignment.vertical,
    VoidCallback? onPressed,
    bool isLoading = false,
    double? width,
    double? height,
    bool expand = false,
    Color? textColor,
  }) {
    return AppButton(
      key: key,
      type: ButtonType.text,
      text: text,
      icon: icon,
      subText: subText,
      subTextAlignment: subTextAlignment,
      onPressed: onPressed,
      isLoading: isLoading,
      width: width,
      height: height,
      expand: expand,
      textColor: textColor,
    );
  }
}
