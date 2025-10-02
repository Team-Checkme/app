import 'package:flutter/material.dart';
import '../constants/app_spacing.dart';

/// Grid System Screen - 사양서 기준 페이지 골격
///
/// 특징:
/// - Scaffold > SafeArea(top: true) > Padding(horizontal: 16)
/// - ListView.separated로 children 렌더링
/// - 기본 separator는 s8 (변경 가능)
/// - 상단 title/actions 슬롯 지원
class GSScreen extends StatelessWidget {
  final List<Widget> children;
  final String? title;
  final List<Widget>? actions;
  final double separatorHeight;
  final bool showAppBar;
  final Color? backgroundColor;
  final Widget? floatingActionButton;

  const GSScreen({
    Key? key,
    required this.children,
    this.title,
    this.actions,
    this.separatorHeight = AppSpacing.s8,
    this.showAppBar = true,
    this.backgroundColor,
    this.floatingActionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: showAppBar && (title != null || actions != null)
          ? AppBar(
              title: title != null ? Text(title!) : null,
              actions: actions,
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
            )
          : null,
      body: SafeArea(
        top: true, // 상단 안전영역 44px 고려
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppGrid.pageMargin,
          ),
          child: children.isEmpty
              ? const SizedBox.shrink()
              : ListView.separated(
                  padding: const EdgeInsets.symmetric(
                    vertical: AppSpacing.s16,
                  ),
                  itemCount: children.length,
                  separatorBuilder: (context, index) =>
                      SizedBox(height: separatorHeight),
                  itemBuilder: (context, index) => children[index],
                ),
        ),
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}
