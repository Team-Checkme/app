import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/checknote_creation_provider.dart';

/// Step1 완료 정보를 보여주는 요약 컴포넌트
class Step1Summary extends ConsumerWidget {
  const Step1Summary({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(checknoteCreationProvider);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFFE1E5EA),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Step 1 완료',
            style: TextStyle(
              fontFamily: 'SUIT',
              fontWeight: FontWeight.w800,
              fontSize: 14,
              color: Color(0xFF0866CA),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '이름: ${state.name ?? ""}',
            style: const TextStyle(
              fontFamily: 'SUIT',
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Color(0xFF191F2A),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '유형: ${state.type?.name ?? ""}',
            style: const TextStyle(
              fontFamily: 'SUIT',
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Color(0xFF3F4654),
            ),
          ),
          if (state.imageUrls.isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(
              '이미지: ${state.imageUrls.length}장',
              style: const TextStyle(
                fontFamily: 'SUIT',
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Color(0xFF3F4654),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
