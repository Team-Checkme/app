import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/constants/app_colors.dart';
import 'package:app/constants/app_spacing.dart';
import 'package:app/design_system/widgets/app_button.dart';
import 'package:app/design_system/widgets/safe_scroll_area.dart';
import '../../../domain/entities/checknote_entity.dart';
import '../../providers/checknote_creation_provider.dart';
import '../molecules/single_check_editor.dart';
import '../molecules/multi_check_editor.dart';
import '../molecules/confirm_remove_check_dialog.dart';

/// 체크노트 생성 Step3 폼 (싱글체크 흐름 반영)
class ChecknoteCreationStep3Form extends ConsumerStatefulWidget {
  final VoidCallback onPrevious;
  final VoidCallback onComplete;

  const ChecknoteCreationStep3Form({
    super.key,
    required this.onPrevious,
    required this.onComplete,
  });

  @override
  ConsumerState<ChecknoteCreationStep3Form> createState() =>
      _ChecknoteCreationStep3FormState();
}

class _ChecknoteCreationStep3FormState
    extends ConsumerState<ChecknoteCreationStep3Form> {
  bool _hasSingleCheck = false;

  void _onAddCheck() {
    setState(() {
      _hasSingleCheck = true;
    });
  }

  Future<void> _confirmRemoveCheck() async {
    final bool? confirmed = await showConfirmRemoveCheckDialog(context);

    if (confirmed == true) {
      setState(() {
        _hasSingleCheck = false;
      });
    }
  }

  void _onAddMultiCheck() {
    final state = ref.read(checknoteCreationProvider);
    if (state.checkItems.length >= 10) return;

    ref.read(checknoteCreationProvider.notifier).addCheckItem(
          '체크 항목 ${state.checkItems.length + 1}',
        );
  }

  void _onRemoveMultiCheck(int index) {
    final state = ref.read(checknoteCreationProvider);
    if (index < 0 || index >= state.checkItems.length) return;

    showConfirmRemoveCheckDialog(context).then((confirmed) {
      if (confirmed == true) {
        ref.read(checknoteCreationProvider.notifier).removeCheckItem(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(checknoteCreationProvider);
    final type = state.type ?? ChecknoteType.single;

    return Stack(
      children: [
        // 메인 콘텐츠 (스크롤 가능)
        SafeScrollArea(
          padding: const EdgeInsets.only(bottom: 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (type == ChecknoteType.single)
                SingleCheckEditor(
                  hasCheck: _hasSingleCheck,
                  onAdd: _onAddCheck,
                  onRemove: _confirmRemoveCheck,
                )
              else
                MultiCheckEditor(
                  checks: state.checkItems,
                  onAdd: _onAddMultiCheck,
                  onRemove: _onRemoveMultiCheck,
                ),
            ],
          ),
        ),
        // 하단 버튼 영역 (고정)
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            color: AppColors.white,
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.s16),
            child: Row(
              children: [
                Expanded(
                  child: AppButton(
                    type: ButtonType.secondaryB,
                    text: '이전',
                    onPressed: widget.onPrevious,
                    height: 48,
                  ),
                ),
                const SizedBox(width: AppSpacing.s8),
                Expanded(
                  child: AppButton(
                    type: ButtonType.primary,
                    text: '미리보기',
                    onPressed: widget.onComplete,
                    height: 48,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
