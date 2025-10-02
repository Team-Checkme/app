import 'package:app/constants/app_colors.dart';
import 'package:app/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// 이미지 업로드 영역 (Molecule)
class ImageUploadArea extends StatelessWidget {
  const ImageUploadArea({
    super.key,
    required this.onImageSelected,
    required this.onImageRemoved,
    this.imageUrls = const [],
    this.title,
    this.description,
    this.showTitle = true,
  });

  final VoidCallback onImageSelected;
  final Function(int index) onImageRemoved;
  final List<String> imageUrls;
  final String? title;
  final String? description;
  final bool showTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 제목과 설명 (showTitle이 true일 때만 표시)
        if (showTitle) ...[
          if (title != null) ...[
            Text(
              title!,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                    color: const Color(0xFF191F2A),
                  ),
            ),
            const SizedBox(height: 8),
          ],
          if (description != null) ...[
            Text(
              description!,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: const Color(0xFF3F4654),
                    fontSize: 14,
                    height: 1.5,
                  ),
            ),
            const SizedBox(height: 16),
          ],
        ],

        // 이미지 업로드 영역 (래핑 레이아웃: 항상 11칸 유지: +버튼 1 + 이미지 10)
        LayoutBuilder(
          builder: (context, constraints) {
            const int columns = 5;
            const double gutter = 12; // crossAxisSpacing/mainAxisSpacing과 동일
            final double totalGutters = gutter * (columns - 1);
            final double itemSize =
                (constraints.maxWidth - totalGutters) / columns;

            final List<Widget> items = [];

            // 1) 첫 칸: + 버튼 (항상 표시, 10장일 때 비활성화)
            final bool isFull = imageUrls.length >= 10;
            items.add(SizedBox(
              width: itemSize,
              height: itemSize,
              child: _buildAddButton(isDisabled: isFull),
            ));

            // 2) 실제 이미지들만 추가 (빈 슬롯 미생성)
            for (int i = 0; i < imageUrls.length; i++) {
              items.add(SizedBox(
                width: itemSize,
                height: itemSize,
                child: _buildImageItem(imageUrls[i], i),
              ));
            }

            return Wrap(
              spacing: gutter,
              runSpacing: gutter,
              children: items,
            );
          },
        ),
      ],
    );
  }

  Widget _buildImageItem(String imageUrl, int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFF000000).withOpacity(0.08),
          width: 1,
        ),
      ),
      child: Stack(
        children: [
          // 이미지
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: const Color(0xFF59B3FF),
                  child: const Icon(
                    Icons.image,
                    color: Colors.white,
                    size: 24,
                  ),
                );
              },
            ),
          ),

          // 삭제 버튼
          Positioned(
            top: 4,
            right: 4,
            child: GestureDetector(
              onTap: () => onImageRemoved(index),
              child: SvgPicture.asset(
                AppIcons.closeFilled,
                width: 24,
                height: 24,
                colorFilter:
                    const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddButton({bool isDisabled = false}) {
    return GestureDetector(
      onTap: isDisabled ? null : onImageSelected,
      child: Container(
        decoration: BoxDecoration(
          color: isDisabled ? const Color(0xFFE9ECEF) : const Color(0xFFF8F9FA),
          border: Border.all(
            color: const Color(0xFFE9ECEF),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          Icons.add,
          color: isDisabled ? const Color(0xFFADB5BD) : const Color(0xFF6C757D),
          size: 24,
        ),
      ),
    );
  }
}
