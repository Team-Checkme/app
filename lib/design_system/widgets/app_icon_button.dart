import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_icons.dart';

/// 아이콘 버튼 상태 정의
enum IconButtonState {
  default_, // 기본 상태
  pressed, // 눌린 상태
  disabled, // 비활성화 상태
}

/// App 전체에서 사용하는 아이콘 전용 버튼 컴포넌트
class AppIconButton extends StatelessWidget {
  // 최솟값 제약조건 (피그마 디자인 기준)
  static const double minSize = 40.0; // 아이콘 버튼 최소 크기 (40x40)

  // Border Radius
  static const double borderRadius = 8.0; // 모든 버튼 8px

  final Widget icon;
  final IconButtonState state;
  final VoidCallback? onPressed;
  final double size;
  final Color? backgroundColor;
  final Color? iconColor;
  final String? tooltip;

  const AppIconButton({
    super.key,
    required this.icon,
    this.state = IconButtonState.default_,
    this.onPressed,
    this.size = minSize,
    this.backgroundColor,
    this.iconColor,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    final isDisabled = state == IconButtonState.disabled || onPressed == null;

    return Container(
      width: size,
      height: size,
      constraints: const BoxConstraints(
        minWidth: minSize,
        minHeight: minSize,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isDisabled ? null : onPressed,
          borderRadius: BorderRadius.circular(borderRadius),
          child: Container(
            decoration: _buildDecoration(),
            child: Center(
              child: _buildIcon(),
            ),
          ),
        ),
      ),
    );
  }

  /// 아이콘 버튼 스타일별 decoration 생성
  BoxDecoration _buildDecoration() {
    if (backgroundColor != null) {
      return BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      );
    }

    switch (state) {
      case IconButtonState.default_:
        return BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(borderRadius),
        );

      case IconButtonState.pressed:
        return BoxDecoration(
          color: Colors.black.withOpacity(0.08), // 피그마 디자인: rgba(0, 0, 0, 0.08)
          borderRadius: BorderRadius.circular(borderRadius),
        );

      case IconButtonState.disabled:
        return BoxDecoration(
          color: AppColors.gray300.withOpacity(0.6), // 60% opacity
          borderRadius: BorderRadius.circular(borderRadius),
        );
    }
  }

  /// 아이콘 렌더링
  Widget _buildIcon() {
    final isDisabled = state == IconButtonState.disabled;

    if (iconColor != null) {
      return IconTheme(
        data: IconThemeData(
          color: iconColor,
          size: _getIconSize(),
        ),
        child: icon,
      );
    }

    // 기본 아이콘 색상 (피그마 디자인 기준)
    Color defaultIconColor;
    switch (state) {
      case IconButtonState.default_:
        defaultIconColor = AppColors.gray900;
        break;
      case IconButtonState.pressed:
        defaultIconColor = AppColors.gray900;
        break;
      case IconButtonState.disabled:
        defaultIconColor = AppColors.gray500;
        break;
    }

    return IconTheme(
      data: IconThemeData(
        color: isDisabled ? AppColors.gray500 : defaultIconColor,
        size: _getIconSize(),
      ),
      child: icon,
    );
  }

  /// 아이콘 크기 계산 (버튼 크기에 비례)
  double _getIconSize() {
    // 피그마 디자인: 40x40 버튼에 24x24 아이콘
    // 비례적으로 계산
    return (size * 24) / minSize;
  }
}

/// 편의 메서드들을 위한 확장
extension AppIconButtonX on AppIconButton {
  /// 기본 아이콘 버튼 생성
  static AppIconButton default_({
    Key? key,
    required Widget icon,
    VoidCallback? onPressed,
    double size = 40.0,
    Color? backgroundColor,
    Color? iconColor,
    String? tooltip,
  }) {
    return AppIconButton(
      key: key,
      icon: icon,
      state: IconButtonState.default_,
      onPressed: onPressed,
      size: size,
      backgroundColor: backgroundColor,
      iconColor: iconColor,
      tooltip: tooltip,
    );
  }

  /// 눌린 상태 아이콘 버튼 생성
  static AppIconButton pressed({
    Key? key,
    required Widget icon,
    VoidCallback? onPressed,
    double size = 40.0,
    Color? backgroundColor,
    Color? iconColor,
    String? tooltip,
  }) {
    return AppIconButton(
      key: key,
      icon: icon,
      state: IconButtonState.pressed,
      onPressed: onPressed,
      size: size,
      backgroundColor: backgroundColor,
      iconColor: iconColor,
      tooltip: tooltip,
    );
  }

  /// 비활성화 상태 아이콘 버튼 생성
  static AppIconButton disabled({
    Key? key,
    required Widget icon,
    double size = 40.0,
    Color? backgroundColor,
    Color? iconColor,
    String? tooltip,
  }) {
    return AppIconButton(
      key: key,
      icon: icon,
      state: IconButtonState.disabled,
      onPressed: null,
      size: size,
      backgroundColor: backgroundColor,
      iconColor: iconColor,
      tooltip: tooltip,
    );
  }

  /// 네비게이션 뒤로가기 버튼 생성
  static AppIconButton back({
    Key? key,
    VoidCallback? onPressed,
    double size = 40.0,
    Color? backgroundColor,
    Color? iconColor,
  }) {
    return AppIconButton(
      key: key,
      icon: const Icon(Icons.arrow_back),
      onPressed: onPressed,
      size: size,
      backgroundColor: backgroundColor,
      iconColor: iconColor,
      tooltip: '뒤로가기',
    );
  }

  /// 검색 버튼 생성
  static AppIconButton search({
    Key? key,
    VoidCallback? onPressed,
    double size = 40.0,
    Color? backgroundColor,
    Color? iconColor,
  }) {
    return AppIconButton(
      key: key,
      icon: const Icon(Icons.search),
      onPressed: onPressed,
      size: size,
      backgroundColor: backgroundColor,
      iconColor: iconColor,
      tooltip: '검색',
    );
  }

  /// 알림 버튼 생성
  static AppIconButton alarm({
    Key? key,
    VoidCallback? onPressed,
    double size = 40.0,
    Color? backgroundColor,
    Color? iconColor,
  }) {
    return AppIconButton(
      key: key,
      icon: const Icon(Icons.notifications),
      onPressed: onPressed,
      size: size,
      backgroundColor: backgroundColor,
      iconColor: iconColor,
      tooltip: '알림',
    );
  }

  /// 메뉴 버튼 생성
  static AppIconButton menu({
    Key? key,
    VoidCallback? onPressed,
    double size = 40.0,
    Color? backgroundColor,
    Color? iconColor,
  }) {
    return AppIconButton(
      key: key,
      icon: const Icon(Icons.more_vert),
      onPressed: onPressed,
      size: size,
      backgroundColor: backgroundColor,
      iconColor: iconColor,
      tooltip: '메뉴',
    );
  }

  /// 화살표 아래 버튼 생성
  static AppIconButton arrowDown({
    Key? key,
    VoidCallback? onPressed,
    double size = 40.0,
    Color? backgroundColor,
    Color? iconColor,
  }) {
    return AppIconButton(
      key: key,
      icon: SvgPicture.asset(
        AppIcons.arrowDownOutline,
        width: 24,
        height: 24,
        colorFilter: ColorFilter.mode(
          iconColor ?? AppColors.gray600,
          BlendMode.srcIn,
        ),
      ),
      onPressed: onPressed,
      size: size,
      backgroundColor: backgroundColor,
      iconColor: iconColor,
      tooltip: '펼치기',
    );
  }

  /// 화살표 위 버튼 생성
  static AppIconButton arrowUp({
    Key? key,
    VoidCallback? onPressed,
    double size = 40.0,
    Color? backgroundColor,
    Color? iconColor,
  }) {
    return AppIconButton(
      key: key,
      icon: SvgPicture.asset(
        AppIcons.arrowTopOutline,
        width: 24,
        height: 24,
        colorFilter: ColorFilter.mode(
          iconColor ?? AppColors.gray600,
          BlendMode.srcIn,
        ),
      ),
      onPressed: onPressed,
      size: size,
      backgroundColor: backgroundColor,
      iconColor: iconColor,
      tooltip: '접기',
    );
  }

  /// 별 버튼 생성
  static AppIconButton star({
    Key? key,
    VoidCallback? onPressed,
    double size = 40.0,
    Color? backgroundColor,
    Color? iconColor,
  }) {
    return AppIconButton(
      key: key,
      icon: const Icon(Icons.star),
      onPressed: onPressed,
      size: size,
      backgroundColor: backgroundColor,
      iconColor: iconColor,
      tooltip: '별표',
    );
  }

  /// 공유 버튼 생성
  static AppIconButton share({
    Key? key,
    VoidCallback? onPressed,
    double size = 40.0,
    Color? backgroundColor,
    Color? iconColor,
  }) {
    return AppIconButton(
      key: key,
      icon: const Icon(Icons.share),
      onPressed: onPressed,
      size: size,
      backgroundColor: backgroundColor,
      iconColor: iconColor,
      tooltip: '공유',
    );
  }
}
