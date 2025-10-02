import 'package:flutter/material.dart';
import '../constants/app_spacing.dart';

/// 5컬럼 그리드 시스템 (사양서 기준)
///
/// 특징:
/// - 5컬럼, 가터 12px, 좌우 마진 16px
/// - colSpan 1~5로 요소 배치
/// - 컬럼 너비 자동 계산
class Grid5 extends StatelessWidget {
  final List<GridItem> children;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  const Grid5({
    Key? key,
    required this.children,
    this.crossAxisSpacing = AppGrid.gutter,
    this.mainAxisSpacing = AppGrid.gutter,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final columnWidth = AppGrid.getColumnWidth(constraints.maxWidth);

        return Wrap(
          spacing: crossAxisSpacing,
          runSpacing: mainAxisSpacing,
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.start,
          children: children.map((item) {
            return SizedBox(
              width: columnWidth * item.colSpan +
                  (item.colSpan - 1) * crossAxisSpacing,
              child: item.child,
            );
          }).toList(),
        );
      },
    );
  }
}

/// Grid 아이템 - colSpan으로 너비 결정
class GridItem {
  final Widget child;
  final int colSpan;

  const GridItem({
    required this.child,
    required this.colSpan,
  }) : assert(colSpan >= 1 && colSpan <= 5, 'colSpan은 1~5 사이여야 합니다');

  /// 전체 너비 (5컬럼)
  static const int fullWidth = 5;

  /// 절반 너비 (2.5컬럼 → 3컬럼으로 반올림)
  static const int halfWidth = 3;

  /// 1/3 너비 (1.67컬럼 → 2컬럼으로 반올림)
  static const int thirdWidth = 2;

  /// 1/4 너비 (1.25컬럼 → 1컬럼으로 반올림)
  static const int quarterWidth = 1;
}
