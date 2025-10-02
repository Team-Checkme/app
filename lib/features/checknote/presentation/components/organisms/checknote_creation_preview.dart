import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../pages/checknote_detail_page.dart';

/// 체크노트 생성 Step3 미리보기 (Organism)
/// - ChecknoteDetailPage와 완전히 동일한 UI 사용
/// - 모든 상호작용 비활성화 (클릭 불가)
class ChecknoteCreationPreview extends ConsumerWidget {
  const ChecknoteCreationPreview({
    super.key,
    required this.onPrevious,
    required this.onCreate,
  });

  final VoidCallback onPrevious;
  final VoidCallback onCreate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ChecknoteDetailPage를 그대로 사용하되, 모든 콜백을 비활성화
    return ChecknoteDetailPage(
      checknoteId: 'preview', // 미리보기용 ID
      onBack: onPrevious, // 뒤로가기만 활성화
      onEdit: null, // 비활성화
      onDelete: null, // 비활성화
      onShare: null, // 비활성화
      onMenu: null, // 비활성화
    );
  }
}
