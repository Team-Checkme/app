import 'package:flutter/material.dart';

/// 이미지 첨부 리스트 가이드 모달 (Molecule)
class ImageUploadGuideModal extends StatelessWidget {
  const ImageUploadGuideModal({
    super.key,
    required this.onClose,
  });

  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: 375,
        height: 562,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            // 헤더
            _buildHeader(),

            // 썸네일 섹션
            _buildThumbnailSection(),

            // 배치 섹션
            _buildLayoutSection(),

            // 가이드라인
            _buildGuidelines(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: const BoxDecoration(
        color: Color(0xFF0F4382),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: Row(
        children: [
          const Expanded(
            child: Text(
              '이미지 첨부 리스트 가이드',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w800,
                letterSpacing: -0.28,
              ),
            ),
          ),
          GestureDetector(
            onTap: onClose,
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.close,
                color: Colors.white,
                size: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildThumbnailSection() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '썸네일',
            style: TextStyle(
              color: Color(0xFF3F4654),
              fontSize: 14,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.28,
            ),
          ),
          const SizedBox(height: 16),

          // 썸네일 예시들
          Row(
            children: [
              // 80x80 썸네일 (삭제 버튼 포함)
              _buildThumbnailExample(
                size: 80,
                hasDeleteButton: true,
                imageColor: const Color(0xFF68D666),
              ),
              const SizedBox(width: 16),

              // 48x48 썸네일
              _buildThumbnailExample(
                size: 48,
                hasDeleteButton: false,
                imageColor: const Color(0xFFF1F4F7),
              ),
              const SizedBox(width: 16),

              // 48x48 썸네일 (Pressed 상태)
              _buildThumbnailExample(
                size: 48,
                hasDeleteButton: false,
                imageColor: const Color(0xFF000000).withOpacity(0.08),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // 가이드라인 텍스트
          const Text(
            'width / height 1:1 비율 유지\n80*80 이하 사이즈에서 라운드 8\n그 이상 사이즈에서 라운드 16\n#000 40% 오버레이\n삭제 버튼 영역 40x40',
            style: TextStyle(
              color: Color(0xFF3F4654),
              fontSize: 12,
              fontWeight: FontWeight.w500,
              letterSpacing: -0.24,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 16),

          const Text(
            'Pressed (#000 8% 오버레이)',
            style: TextStyle(
              color: Color(0xFF3F4654),
              fontSize: 12,
              fontWeight: FontWeight.w500,
              letterSpacing: -0.24,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildThumbnailExample({
    required double size,
    required bool hasDeleteButton,
    required Color imageColor,
  }) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: imageColor,
        borderRadius: BorderRadius.circular(size <= 80 ? 8 : 16),
        border: Border.all(
          color: const Color(0xFF000000).withOpacity(0.08),
          width: 1,
        ),
      ),
      child: Stack(
        children: [
          // 삭제 버튼이 있는 경우
          if (hasDeleteButton)
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFF000000).withOpacity(0.4),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                ),
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildLayoutSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '배치',
            style: TextStyle(
              color: Color(0xFF3F4654),
              fontSize: 14,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.28,
            ),
          ),
          const SizedBox(height: 16),

          // 5x2 그리드 레이아웃
          Container(
            width: 327,
            height: 80,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 1,
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                if (index < 4) {
                  // 첫 번째 줄 (4개)
                  return _buildGridItem(
                    number: index + 1,
                    isActive: true,
                  );
                } else if (index == 4) {
                  // 첫 번째 줄 마지막 (빈 공간)
                  return const SizedBox.shrink();
                } else if (index < 9) {
                  // 두 번째 줄 (4개)
                  return _buildGridItem(
                    number: index,
                    isActive: true,
                  );
                } else {
                  // 두 번째 줄 마지막 (빈 공간)
                  return const SizedBox.shrink();
                }
              },
            ),
          ),

          const SizedBox(height: 16),

          // 가이드라인 텍스트
          const Text(
            '한 줄에 5개 배치\n썸네일 간 간격 8 유지하면서 컨테이너에 맞춰 사이즈 확장됨',
            style: TextStyle(
              color: Color(0xFF3F4654),
              fontSize: 12,
              fontWeight: FontWeight.w500,
              letterSpacing: -0.24,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridItem({required int number, required bool isActive}) {
    return Container(
      decoration: BoxDecoration(
        color: isActive
            ? const Color(0xFF719300)
            : const Color(0xFFFFABCF).withOpacity(0.4),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Text(
          '$number',
          style: TextStyle(
            color: isActive ? Colors.white : const Color(0xFFFFABCF),
            fontSize: 8,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.16,
          ),
        ),
      ),
    );
  }

  Widget _buildGuidelines() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '이미지 추가 버튼',
            style: TextStyle(
              color: Color(0xFF3F4654),
              fontSize: 14,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.28,
            ),
          ),
          const SizedBox(height: 16),

          // 이미지 추가 버튼 예시들
          Row(
            children: [
              // 80x80 추가 버튼
              _buildAddButtonExample(size: 80),
              const SizedBox(width: 16),

              // 48x48 추가 버튼
              _buildAddButtonExample(size: 48),
              const SizedBox(width: 16),

              // 48x48 추가 버튼 (Pressed 상태)
              _buildAddButtonExample(
                size: 48,
                isPressed: true,
              ),
            ],
          ),

          const SizedBox(height: 16),

          const Text(
            '썸네일 10개 이상에서 추가 버튼 숨김 처리',
            style: TextStyle(
              color: Color(0xFF3F4654),
              fontSize: 12,
              fontWeight: FontWeight.w500,
              letterSpacing: -0.24,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddButtonExample(
      {required double size, bool isPressed = false}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: isPressed
            ? const Color(0xFF000000).withOpacity(0.08)
            : const Color(0xFFF1F4F7),
        border: Border.all(
          color: const Color(0xFFE1E5EA),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(size <= 80 ? 8 : 16),
      ),
      child: Icon(
        Icons.add,
        color: const Color(0xFF191F2A),
        size: size * 0.3, // 비율에 맞게 아이콘 크기 조정
      ),
    );
  }
}
