import 'package:flutter/material.dart';
import 'package:app/constants/app_colors.dart';
import 'package:app/constants/app_spacing.dart';

/// 이미지 갤러리 컴포넌트
/// - 단일 이미지 또는 다중 이미지 그리드 표시
/// - 8px 간격으로 정렬
/// - 이미지 탭 콜백 지원
class AppImageGallery extends StatelessWidget {
  const AppImageGallery({
    super.key,
    required this.imageUrls,
    this.onImageTap,
    this.spacing = AppSpacing.s8,
    this.borderRadius = 8,
    this.maxImages = 4,
  });

  /// 이미지 URL 리스트
  final List<String> imageUrls;

  /// 이미지 탭 콜백 (인덱스와 함께)
  final ValueChanged<int>? onImageTap;

  /// 이미지 간 간격
  final double spacing;

  /// 모서리 둥글기
  final double borderRadius;

  /// 최대 표시할 이미지 수 (나머지는 +N 표시)
  final int maxImages;

  @override
  Widget build(BuildContext context) {
    if (imageUrls.isEmpty) {
      return const SizedBox.shrink();
    }

    if (imageUrls.length == 1) {
      return _buildSingleImage(imageUrls[0], 0);
    }

    return _buildMultiImageGrid();
  }

  /// 단일 이미지 표시
  Widget _buildSingleImage(String imageUrl, int index) {
    return GestureDetector(
      onTap: () => onImageTap?.call(index),
      child: Container(
        width: 144,
        height: 144,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  /// 다중 이미지 그리드 표시
  Widget _buildMultiImageGrid() {
    final displayImages = imageUrls.take(maxImages).toList();
    final remainingCount = imageUrls.length - maxImages;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 0; i < displayImages.length; i++) ...[
            _buildGridImage(displayImages[i], i),
            if (i < displayImages.length - 1) SizedBox(width: spacing),
          ],
          if (remainingCount > 0) ...[
            SizedBox(width: spacing),
            _buildRemainingCountCard(remainingCount),
          ],
        ],
      ),
    );
  }

  /// 그리드 이미지 아이템
  Widget _buildGridImage(String imageUrl, int index) {
    return GestureDetector(
      onTap: () => onImageTap?.call(index),
      child: Container(
        width: 144,
        height: 144,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  /// 남은 이미지 수 카드
  Widget _buildRemainingCountCard(int remainingCount) {
    return GestureDetector(
      onTap: () => onImageTap?.call(maxImages),
      child: Container(
        width: 144,
        height: 144,
        decoration: BoxDecoration(
          color: AppColors.gray200,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Center(
          child: Text(
            '+$remainingCount',
            style: TextStyle(
              color: AppColors.gray600,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

/// 이미지 갤러리 그리드 컴포넌트
/// - 2열 그리드로 이미지 표시
/// - 각 행마다 간격 조정
class AppImageGalleryGrid extends StatelessWidget {
  const AppImageGalleryGrid({
    super.key,
    required this.imageUrls,
    this.onImageTap,
    this.spacing = AppSpacing.s8,
    this.borderRadius = 8,
    this.crossAxisCount = 2,
  });

  final List<String> imageUrls;
  final ValueChanged<int>? onImageTap;
  final double spacing;
  final double borderRadius;
  final int crossAxisCount;

  @override
  Widget build(BuildContext context) {
    if (imageUrls.isEmpty) {
      return const SizedBox.shrink();
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: spacing,
        mainAxisSpacing: spacing,
        childAspectRatio: 1.0,
      ),
      itemCount: imageUrls.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => onImageTap?.call(index),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              image: DecorationImage(
                image: NetworkImage(imageUrls[index]),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}

/// 이미지 갤러리 슬라이더 컴포넌트
/// - 가로 스크롤 가능한 이미지 슬라이더
/// - 페이지 인디케이터 포함
class AppImageGallerySlider extends StatefulWidget {
  const AppImageGallerySlider({
    super.key,
    required this.imageUrls,
    this.onImageTap,
    this.height = 200,
    this.borderRadius = 8,
    this.showIndicator = true,
  });

  final List<String> imageUrls;
  final ValueChanged<int>? onImageTap;
  final double height;
  final double borderRadius;
  final bool showIndicator;

  @override
  State<AppImageGallerySlider> createState() => _AppImageGallerySliderState();
}

class _AppImageGallerySliderState extends State<AppImageGallerySlider> {
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.imageUrls.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        SizedBox(
          height: 144,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemCount: widget.imageUrls.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => widget.onImageTap?.call(index),
                child: Container(
                  width: 144,
                  height: 144,
                  margin: const EdgeInsets.symmetric(horizontal: AppSpacing.s4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    image: DecorationImage(
                      image: NetworkImage(widget.imageUrls[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        if (widget.showIndicator && widget.imageUrls.length > 1) ...[
          const SizedBox(height: AppSpacing.s8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < widget.imageUrls.length; i++) ...[
                Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: i == _currentIndex
                        ? AppColors.primary
                        : AppColors.gray300,
                  ),
                ),
              ],
            ],
          ),
        ],
      ],
    );
  }
}
