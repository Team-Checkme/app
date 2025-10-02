import 'package:flutter/material.dart';
import '../components/gs_screen.dart';
import '../components/grid_5.dart';
import '../constants/app_spacing.dart';
import '../constants/app_colors.dart';
import '../features/checknote/presentation/components/molecules/image_upload_guide_modal.dart';

/// 사양서 이미지 재현 샘플 화면
///
/// 구현된 내용:
/// - 섹션 A: Title + 아래 s16 여백
/// - 섹션 B: 전폭 카드 (colSpan:5)
/// - 섹션 C: 버튼/입력 예시 (세로 s4, 가로 s8)
class SampleScreen extends StatelessWidget {
  const SampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GSScreen(
      title: '샘플 화면',
      children: [
        // 섹션 A: Title + 아래 s16 여백
        _buildSectionA(),

        // 섹션 B: 전폭 카드 (colSpan:5)
        _buildSectionB(),

        // 섹션 C: 버튼/입력 예시
        _buildSectionC(),
      ],
    );
  }

  Widget _buildSectionA() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Title',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.gray900,
          ),
        ),
        // 아래 여백 s16 (사양서 기준)
        const SizedBox(height: AppSpacing.s16),
      ],
    );
  }

  Widget _buildSectionB() {
    return Grid5(
      children: [
        GridItem(
          colSpan: GridItem.fullWidth, // 5컬럼 = 전폭
          child: Container(
            height: 120, // placeholder 높이
            decoration: BoxDecoration(
              color: AppColors.blue100,
              borderRadius: BorderRadius.circular(12), // 팀 기본 라운드
              border: Border.all(
                color: AppColors.blue200,
                width: 1,
              ),
            ),
            child: Center(
              child: Text(
                '전폭 카드 (5컬럼)',
                style: TextStyle(
                  color: AppColors.blue700,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionC() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 상단 라벨/설명
        Text(
          '체크하기',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.gray800,
          ),
        ),

        // 세로 s4 여백 (사양서 기준)
        const SizedBox(height: AppSpacing.s4),

        // CTA 버튼
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.s16,
            vertical: AppSpacing.s12,
          ),
          decoration: BoxDecoration(
            color: AppColors.blue500,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            '체크하기 05:34:39',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        // 세로 s16 여백
        const SizedBox(height: AppSpacing.s16),

        // 이미지 업로드 가이드 모달 테스트 버튼
        Builder(
          builder: (context) => Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.s16,
              vertical: AppSpacing.s12,
            ),
            decoration: BoxDecoration(
              color: AppColors.gray100,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: AppColors.gray200,
                width: 1,
              ),
            ),
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => ImageUploadGuideModal(
                    onClose: () => Navigator.of(context).pop(),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.image,
                    color: AppColors.gray700,
                    size: 20,
                  ),
                  const SizedBox(width: AppSpacing.s8),
                  Text(
                    '이미지 업로드 가이드 모달 보기',
                    style: TextStyle(
                      color: AppColors.gray700,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        // 세로 s16 여백
        const SizedBox(height: AppSpacing.s16),

        // 입력 필드 + 등록 버튼 (가로 s8 간격)
        Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: '입력하세요',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: AppColors.gray300),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.s12,
                    vertical: AppSpacing.s12,
                  ),
                ),
              ),
            ),

            // 가로 s8 간격 (사양서 기준)
            const SizedBox(width: AppSpacing.s8),

            // 고정폭 등록 버튼
            SizedBox(
              width: 80,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.blue500,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.s12,
                    vertical: AppSpacing.s12,
                  ),
                ),
                child: const Text('등록'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
