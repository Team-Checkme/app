import 'package:app/constants/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:app/constants/app_colors.dart';
import 'package:app/constants/app_spacing.dart';
import 'package:app/design_system/widgets/app_accordion.dart';
import 'package:app/design_system/widgets/app_image_gallery.dart';

/// 체크노트 상세 아코디언 섹션 컴포넌트
/// - 체크 노트 소개를 아코디언 형태로 표시
/// - 텍스트와 이미지를 포함할 수 있음
class ChecknoteDetailAccordionSection extends StatelessWidget {
  const ChecknoteDetailAccordionSection({
    super.key,
    required this.title,
    required this.content,
    this.images = const [],
    this.isExpanded = false,
    this.onToggle,
    this.onImageTap,
    this.padding = const EdgeInsets.fromLTRB(AppSpacing.s16, AppSpacing.s8, AppSpacing.s16, AppSpacing.s8),
    this.borderRadius = 16,
  });

  /// 아코디언 제목
  final String title;

  /// 아코디언 내용 (텍스트)
  final String content;

  /// 이미지 URL 리스트
  final List<String> images;

  /// 초기 확장 상태
  final bool isExpanded;

  /// 토글 콜백
  final ValueChanged<bool>? onToggle;

  /// 이미지 탭 콜백
  final ValueChanged<int>? onImageTap;

  /// 내부 패딩
  final EdgeInsets padding;

  /// 모서리 둥글기
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return AppAccordion(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
      titlePadding: padding,
      title: title,
      isExpanded: isExpanded,
      onToggle: onToggle,
      backgroundColor: AppColors.gray50,
      borderRadius: borderRadius,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 텍스트 내용 (전체 padding 적용)
          if (content.isNotEmpty) ...[
            Padding(
              padding: padding,
              child: Text(
                content,
                style: AppTypography.body14M.copyWith(
                  color: AppColors.gray900,
                ),
              ),
            ),
            if (images.isNotEmpty) const SizedBox(height: AppSpacing.s16),
          ],

          // 이미지 갤러리 (좌, 하단만 padding 적용)
          if (images.isNotEmpty)
            Padding(
              padding: EdgeInsets.only(
                left: padding.left,
                bottom: padding.bottom,
              ),
              child: AppImageGallery(
                imageUrls: images,
                onImageTap: onImageTap,
                spacing: AppSpacing.s8,
                borderRadius: 8,
              ),
            ),
        ],
      ),
    );
  }
}

/// 체크 상세 아코디언 섹션 변형들
class ChecknoteDetailAccordionSectionVariants {
  /// 기본 아코디언 섹션
  static ChecknoteDetailAccordionSection default_({
    Key? key,
    required String title,
    required String content,
    List<String> images = const [],
    bool isExpanded = false,
    ValueChanged<bool>? onToggle,
    ValueChanged<int>? onImageTap,
  }) {
    return ChecknoteDetailAccordionSection(
      key: key,
      title: title,
      content: content,
      images: images,
      isExpanded: isExpanded,
      onToggle: onToggle,
      onImageTap: onImageTap,
    );
  }

  /// 텍스트만 있는 아코디언 섹션
  static ChecknoteDetailAccordionSection textOnly({
    Key? key,
    required String title,
    required String content,
    bool isExpanded = false,
    ValueChanged<bool>? onToggle,
  }) {
    return ChecknoteDetailAccordionSection(
      key: key,
      title: title,
      content: content,
      images: const [],
      isExpanded: isExpanded,
      onToggle: onToggle,
    );
  }

  /// 이미지만 있는 아코디언 섹션
  static ChecknoteDetailAccordionSection imageOnly({
    Key? key,
    required String title,
    required List<String> images,
    bool isExpanded = false,
    ValueChanged<bool>? onToggle,
    ValueChanged<int>? onImageTap,
  }) {
    return ChecknoteDetailAccordionSection(
      key: key,
      title: title,
      content: '',
      images: images,
      isExpanded: isExpanded,
      onToggle: onToggle,
      onImageTap: onImageTap,
    );
  }
}
