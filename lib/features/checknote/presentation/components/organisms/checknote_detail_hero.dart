import 'package:flutter/material.dart';
import 'package:app/constants/app_colors.dart';
import 'package:app/constants/app_spacing.dart';
import 'package:app/constants/app_typography.dart';
import '../atoms/label_tag.dart';
import '../molecules/profile_row.dart';

/// 체크노트 상세 히어로 섹션 컴포넌트
/// - 이미지 carousel, 제목, 해시태그, 라벨들, 프로필 정보를 포함
class ChecknoteDetailHero extends StatefulWidget {
  const ChecknoteDetailHero({
    super.key,
    required this.title,
    required this.hashtags,
    required this.masterName,
    required this.participantCount,
    required this.maxParticipants,
    this.imageUrls = const [],
    this.currentCheckCount = 0,
    this.totalCheckCount = 0,
    this.labels = const [],
    this.onImageTap,
    this.padding = const EdgeInsets.all(AppSpacing.s16),
    this.borderRadius = 8,
  });

  /// 체크노트 제목
  final String title;

  /// 해시태그 리스트
  final List<String> hashtags;

  /// 마스터 이름
  final String masterName;

  /// 현재 참여자 수
  final int participantCount;

  /// 최대 참여자 수
  final int maxParticipants;

  /// 히어로 이미지 URL 리스트
  final List<String> imageUrls;

  /// 현재 체크 수
  final int currentCheckCount;

  /// 전체 체크 수
  final int totalCheckCount;

  /// 라벨들 (마스터, 싱글 등)
  final List<LabelTag> labels;

  /// 이미지 탭 콜백
  final ValueChanged<int>? onImageTap;

  /// 내부 패딩
  final EdgeInsets padding;

  /// 모서리 둥글기
  final double borderRadius;

  @override
  State<ChecknoteDetailHero> createState() => _ChecknoteDetailHeroState();
}

class _ChecknoteDetailHeroState extends State<ChecknoteDetailHero> {
  late PageController _pageController;
  int _currentImageIndex = 0;

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 히어로 이미지 carousel
        if (widget.imageUrls.isNotEmpty) _buildHeroImageCarousel(),

        const SizedBox(height: AppSpacing.s16),

        // 라벨들
        if (widget.labels.isNotEmpty) ...[
          Row(
            children: [
              for (int i = 0; i < widget.labels.length; i++) ...[
                widget.labels[i],
                if (i < widget.labels.length - 1)
                  const SizedBox(width: AppSpacing.s8),
              ],
            ],
          ),
          const SizedBox(height: AppSpacing.s8),
        ],

        // 제목과 해시태그
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: AppTypography.heading20EB.copyWith(
                color: AppColors.gray900,
              ),
            ),
            const SizedBox(height: AppSpacing.s4),
            Text(
              widget.hashtags.map((tag) => '#$tag').join(' '),
              style: AppTypography.body14B.copyWith(
                color: AppColors.gray600,
              ),
            ),
          ],
        ),

        const SizedBox(height: AppSpacing.s16),

        // 프로필 정보
        ProfileRow(
          masterName: widget.masterName,
          participantCount: widget.participantCount,
          maxParticipants: widget.maxParticipants,
        ),
      ],
    );
  }

  /// 히어로 이미지 carousel 위젯
  Widget _buildHeroImageCarousel() {
    // 이미지 carousel
    return Container(
      margin: const EdgeInsets.symmetric(vertical: AppSpacing.s16),
      height: 200,
      width: double.infinity,
      child: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentImageIndex = index % widget.imageUrls.length;
              });
            },
            itemCount: widget.imageUrls.length > 1
                ? null
                : widget.imageUrls.length, // 무한 스크롤을 위해 null 설정
            itemBuilder: (context, index) {
              final imageIndex = index % widget.imageUrls.length;
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  image: DecorationImage(
                    image: NetworkImage(widget.imageUrls[imageIndex]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
          _buildImageIndicator(),
        ],
      ),
    );
  }

  Widget _buildImageIndicator() {
    // 이미지 인디케이터
    if (widget.imageUrls.isEmpty) return const SizedBox.shrink();
    return Positioned(
      top: 8,
      right: 8, // 체크 카운트 배지가 있으면 왼쪽으로 이동
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 4,
          vertical: 2,
        ),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.6),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          '${(_currentImageIndex % widget.imageUrls.length) + 1}/${widget.imageUrls.length}',
          style: AppTypography.caption12M.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

/// 체크 상세 히어로 섹션 변형들
class ChecknoteDetailHeroVariants {
  /// 기본 히어로 섹션
  static ChecknoteDetailHero default_({
    Key? key,
    required String title,
    required List<String> hashtags,
    required String masterName,
    required int participantCount,
    required int maxParticipants,
    List<String> imageUrls = const [],
    int currentCheckCount = 0,
    int totalCheckCount = 0,
    List<LabelTag> labels = const [],
  }) {
    return ChecknoteDetailHero(
      key: key,
      title: title,
      hashtags: hashtags,
      masterName: masterName,
      participantCount: participantCount,
      maxParticipants: maxParticipants,
      imageUrls: imageUrls,
      currentCheckCount: currentCheckCount,
      totalCheckCount: totalCheckCount,
      labels: labels,
    );
  }

  /// 마스터 라벨이 있는 히어로 섹션
  static ChecknoteDetailHero withMasterLabel({
    Key? key,
    required String title,
    required List<String> hashtags,
    required String masterName,
    required int participantCount,
    required int maxParticipants,
    List<String> imageUrls = const [],
    int currentCheckCount = 0,
    int totalCheckCount = 0,
    bool isSingle = true,
  }) {
    final labels = [
      LabelTagVariants.master(),
      if (isSingle) LabelTagVariants.single() else LabelTagVariants.multi(),
    ];

    return ChecknoteDetailHero(
      key: key,
      title: title,
      hashtags: hashtags,
      masterName: masterName,
      participantCount: participantCount,
      maxParticipants: maxParticipants,
      imageUrls: imageUrls,
      currentCheckCount: currentCheckCount,
      totalCheckCount: totalCheckCount,
      labels: labels,
    );
  }
}
