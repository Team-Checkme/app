import 'package:flutter/material.dart';
import 'package:app/constants/app_colors.dart';
import 'package:app/constants/app_spacing.dart';
import 'package:app/constants/app_typography.dart';
import 'package:app/design_system/widgets/app_icon_button.dart';

/// 아코디언 컴포넌트
/// - 접힌/펼쳐진 상태를 지원
/// - 제목과 화살표 아이콘을 포함한 헤더
/// - 내용 영역 (텍스트 또는 위젯)
/// - 눌렀을 때 상태 변화 지원
class AppAccordion extends StatefulWidget {
  const AppAccordion({
    super.key,
    required this.title,
    required this.child,
    this.isExpanded = false,
    this.onToggle,
    this.backgroundColor,
    this.borderRadius = 16,
    this.padding = const EdgeInsets.all(AppSpacing.s16),
    this.titlePadding,
    this.gap = AppSpacing.s16,
  });

  /// 아코디언 제목
  final String title;

  /// 아코디언 내용
  final Widget child;

  /// 초기 확장 상태
  final bool isExpanded;

  /// 토글 콜백
  final ValueChanged<bool>? onToggle;

  /// 배경색
  final Color? backgroundColor;

  /// 모서리 둥글기
  final double borderRadius;

  /// 내부 패딩
  final EdgeInsets padding;

  /// 제목 패딩 (null이면 padding 사용)
  final EdgeInsets? titlePadding;

  /// 제목과 내용 사이 간격
  final double gap;

  @override
  State<AppAccordion> createState() => _AppAccordionState();
}

class _AppAccordionState extends State<AppAccordion>
    with SingleTickerProviderStateMixin {
  late bool _isExpanded;
  late AnimationController _animationController;
  late Animation<double> _expandAnimation;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.isExpanded;
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    if (_isExpanded) {
      _animationController.value = 1.0;
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
    widget.onToggle?.call(_isExpanded);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? AppColors.gray50,
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      child: Column(
        children: [
          // 헤더 (제목 + 화살표 버튼)
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: _toggle,
              borderRadius: BorderRadius.circular(widget.borderRadius),
              child: Container(
                padding: widget.titlePadding ?? widget.padding,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.title,
                        style: AppTypography.body16EB.copyWith(
                          color: AppColors.gray900,
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.s8),
                    AnimatedBuilder(
                      animation: _expandAnimation,
                      builder: (context, child) {
                        return _isExpanded
                            ? AppIconButtonX.arrowUp(
                                onPressed: _toggle,
                                size: 32,
                                backgroundColor: Colors.transparent,
                                iconColor: AppColors.gray600,
                              )
                            : AppIconButtonX.arrowDown(
                                onPressed: _toggle,
                                size: 32,
                                backgroundColor: Colors.transparent,
                                iconColor: AppColors.gray600,
                              );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),

          // 내용 영역 (애니메이션과 함께)
          SizeTransition(
            sizeFactor: _expandAnimation,
            child: FadeTransition(
              opacity: _expandAnimation,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                  left: widget.padding.left,
                  right: widget.padding.right,
                  bottom: widget.padding.bottom,
                ),
                child: widget.child,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// 아코디언 그룹 컴포넌트
/// - 여러 아코디언을 세로로 배치
/// - 각 아코디언 사이의 간격 조정
class AppAccordionGroup extends StatelessWidget {
  const AppAccordionGroup({
    super.key,
    required this.children,
    this.spacing = AppSpacing.s8,
  });

  final List<AppAccordion> children;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < children.length; i++) ...[
          children[i],
          if (i < children.length - 1) SizedBox(height: spacing),
        ],
      ],
    );
  }
}
