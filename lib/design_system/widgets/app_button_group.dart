import 'package:flutter/material.dart';
import '../../constants/app_spacing.dart';
import 'app_button.dart';

/// 버튼 조합 방향
enum ButtonGroupDirection {
  horizontal, // 가로 배치
  vertical, // 세로 배치
}

/// 버튼 간격 타입
enum ButtonGroupSpacing {
  tight, // 8px 간격 (기본)
  normal, // 16px 간격
  loose, // 24px 간격
}

/// App 전체에서 사용하는 버튼 그룹 컴포넌트
/// 피그마 디자인 가이드: "계위가 높은 버튼을 우측에 배치"
class AppButtonGroup extends StatelessWidget {
  final List<Widget> children;
  final ButtonGroupDirection direction;
  final ButtonGroupSpacing spacing;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final bool expand;

  const AppButtonGroup({
    super.key,
    required this.children,
    this.direction = ButtonGroupDirection.horizontal,
    this.spacing = ButtonGroupSpacing.tight,
    this.mainAxisAlignment = MainAxisAlignment.end,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.expand = false,
  });

  @override
  Widget build(BuildContext context) {
    if (children.isEmpty) return const SizedBox.shrink();
    if (children.length == 1) return children.first;

    final gap = _getSpacingValue();

    if (direction == ButtonGroupDirection.horizontal) {
      return Row(
        mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min,
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: _buildChildrenWithGap(gap),
      );
    } else {
      return Column(
        mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min,
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: _buildChildrenWithGap(gap),
      );
    }
  }

  /// 간격 값 반환
  double _getSpacingValue() {
    switch (spacing) {
      case ButtonGroupSpacing.tight:
        return AppSpacing.s8; // 8px
      case ButtonGroupSpacing.normal:
        return AppSpacing.s16; // 16px
      case ButtonGroupSpacing.loose:
        return AppSpacing.s24; // 24px
    }
  }

  /// 자식 위젯들에 간격 추가
  List<Widget> _buildChildrenWithGap(double gap) {
    final List<Widget> result = [];

    for (int i = 0; i < children.length; i++) {
      // expand가 true일 때 각 자식을 Expanded로 감싸기
      Widget child = children[i];
      if (expand) {
        child = Expanded(child: child);
      }

      result.add(child);

      // 마지막 요소가 아니면 간격 추가
      if (i < children.length - 1) {
        if (direction == ButtonGroupDirection.horizontal) {
          result.add(SizedBox(width: gap));
        } else {
          result.add(SizedBox(height: gap));
        }
      }
    }

    return result;
  }
}

/// 편의 메서드들을 위한 확장
extension AppButtonGroupX on AppButtonGroup {
  /// 가로 버튼 그룹 생성 (기본)
  static AppButtonGroup horizontal({
    Key? key,
    required List<Widget> children,
    ButtonGroupSpacing spacing = ButtonGroupSpacing.tight,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.end,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    bool expand = false,
  }) {
    return AppButtonGroup(
      key: key,
      children: children,
      direction: ButtonGroupDirection.horizontal,
      spacing: spacing,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      expand: expand,
    );
  }

  /// 세로 버튼 그룹 생성
  static AppButtonGroup vertical({
    Key? key,
    required List<Widget> children,
    ButtonGroupSpacing spacing = ButtonGroupSpacing.tight,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.center,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    bool expand = false,
  }) {
    return AppButtonGroup(
      key: key,
      children: children,
      direction: ButtonGroupDirection.vertical,
      spacing: spacing,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      expand: expand,
    );
  }

  /// 취소 + 확인 버튼 조합 (피그마 디자인 가이드)
  static AppButtonGroup cancelConfirm({
    Key? key,
    required VoidCallback onCancel,
    required VoidCallback onConfirm,
    String cancelText = '취소',
    String confirmText = '확인',
    bool isLoading = false,
    bool expand = false,
  }) {
    return AppButtonGroup(
      key: key,
      children: [
        AppButton(
          type: ButtonType.secondaryB,
          text: cancelText,
          onPressed: onCancel,
          expand: expand,
        ),
        AppButton(
          type: ButtonType.primary,
          text: confirmText,
          onPressed: onConfirm,
          isLoading: isLoading,
          expand: expand,
        ),
      ],
      expand: expand,
    );
  }

  /// 뒤로가기 + 확인 버튼 조합
  static AppButtonGroup backConfirm({
    Key? key,
    required VoidCallback onBack,
    required VoidCallback onConfirm,
    String backText = '뒤로가기',
    String confirmText = '확인',
    bool isLoading = false,
    bool expand = false,
  }) {
    return AppButtonGroup(
      key: key,
      children: [
        AppButton(
          type: ButtonType.text,
          text: backText,
          onPressed: onBack,
          expand: expand,
        ),
        AppButton(
          type: ButtonType.primary,
          text: confirmText,
          onPressed: onConfirm,
          isLoading: isLoading,
          expand: expand,
        ),
      ],
      expand: expand,
    );
  }

  /// 텍스트 + SecondaryA 버튼 조합 (피그마 디자인 예시)
  static AppButtonGroup textSecondaryA({
    Key? key,
    required VoidCallback onText,
    required VoidCallback onSecondaryA,
    required String textText,
    required String secondaryAText,
    bool expand = false,
  }) {
    return AppButtonGroup(
      key: key,
      children: [
        AppButton(
          type: ButtonType.text,
          text: textText,
          onPressed: onText,
          expand: expand,
        ),
        AppButton(
          type: ButtonType.secondaryA,
          text: secondaryAText,
          onPressed: onSecondaryA,
          expand: expand,
        ),
      ],
      expand: expand,
    );
  }

  /// SecondaryB + Primary 버튼 조합 (피그마 디자인 예시)
  static AppButtonGroup secondaryBPrimary({
    Key? key,
    required VoidCallback onSecondaryB,
    required VoidCallback onPrimary,
    required String secondaryBText,
    required String primaryText,
    bool isLoading = false,
    bool expand = false,
  }) {
    return AppButtonGroup(
      key: key,
      children: [
        AppButton(
          type: ButtonType.secondaryB,
          text: secondaryBText,
          onPressed: onSecondaryB,
          expand: expand,
        ),
        AppButton(
          type: ButtonType.primary,
          text: primaryText,
          onPressed: onPrimary,
          isLoading: isLoading,
          expand: expand,
        ),
      ],
      expand: expand,
    );
  }
}
