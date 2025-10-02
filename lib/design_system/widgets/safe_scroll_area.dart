import 'package:flutter/material.dart';
import '../../constants/app_spacing.dart';

/// 키보드 처리와 최소 높이 보장을 포함한 안전한 스크롤 영역
class SafeScrollArea extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;

  const SafeScrollArea({
    super.key,
    required this.child,
    this.padding,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          // 키보드가 올라오면 여백 확보(폼이면 유용)
          padding: padding ??
              EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: child,
          ),
        );
      },
    );
  }
}
