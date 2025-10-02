import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'checknote_create_page.dart';
import 'checknote_detail_page.dart';
import '../providers/checknote_creation_provider.dart';

/// 체크노트 생성 데모 페이지
class ChecknoteCreationDemoPage extends ConsumerWidget {
  const ChecknoteCreationDemoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(checknoteCreationProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('체크노트 생성 데모'),
        backgroundColor: const Color(0xFFD9ECFC),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 현재 상태 표시
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '현재 상태',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text('현재 Step: ${state.currentStep}'),
                    Text('이름: ${state.name ?? "없음"}'),
                    Text('유형: ${state.type?.name ?? "없음"}'),
                    Text('이미지: ${state.imageUrls.length}장'),
                    Text('설명: ${state.description ?? "없음"}'),
                    Text(
                        '키워드: ${state.keywords.isEmpty ? "없음" : state.keywords.join(", ")}'),
                    Text(
                        '참여 인원: ${state.isUnlimitedParticipants ? "제한 없음" : (state.maxParticipants?.toString() ?? "설정 안됨")}'),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // 버튼들
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ChecknoteCreatePage(),
                  ),
                );
              },
              child: const Text('Step 1 시작'),
            ),

            const SizedBox(height: 8),

            ElevatedButton(
              onPressed: state.isStep1Complete
                  ? () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ChecknoteCreatePage(),
                        ),
                      );
                    }
                  : null,
              child: const Text('Step 2 시작 (Step 1 완료 후)'),
            ),

            const SizedBox(height: 8),

            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ChecknoteDetailPage(
                      checknoteId: 'demo_checknote_123',
                      onBack: null, // 기본 뒤로가기 사용
                      onEdit: null,
                      onDelete: null,
                      onShare: null,
                      onMenu: null,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              child: const Text('체크노트 상세 페이지 보기'),
            ),

            const SizedBox(height: 8),

            ElevatedButton(
              onPressed: () {
                ref.read(checknoteCreationProvider.notifier).reset();
              },
              child: const Text('상태 초기화'),
            ),
          ],
        ),
      ),
    );
  }
}
