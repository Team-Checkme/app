import 'package:app/design_system/widgets/app_button.dart';
import 'package:app/design_system/widgets/app_button_group.dart';
import 'package:flutter/material.dart';
import '../../../domain/entities/checknote_entity.dart';

/// 체크 노트 유형 선택 컴포넌트 (Molecule)
class ChecknoteTypeSelector extends StatefulWidget {
  const ChecknoteTypeSelector({
    super.key,
    required this.onTypeChanged,
    this.initialType = ChecknoteType.single,
  });

  final ValueChanged<ChecknoteType> onTypeChanged;
  final ChecknoteType initialType;

  @override
  State<ChecknoteTypeSelector> createState() => _ChecknoteTypeSelectorState();
}

class _ChecknoteTypeSelectorState extends State<ChecknoteTypeSelector> {
  late ChecknoteType _selectedType;

  @override
  void initState() {
    super.initState();
    _selectedType = widget.initialType;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 라벨과 필수 표시
        Row(
          children: [
            Text(
              '유형',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                    color: const Color(0xFF191F2A),
                  ),
            ),
            const SizedBox(width: 4),
            Text(
              '*',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                    color: const Color(0xFFFA6C6C),
                  ),
            ),
          ],
        ),
        const SizedBox(height: 8),

        // 설명 텍스트
        Text(
          '싱글 체크 노트는 단 하나의 체크를, 멀티 체크 노트는 최대 10개까지 체크를 관리할 수 있습니다.\n체크 노트가 만들어진 후에는 유형을 수정할 수 없습니다.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: const Color(0xFF3F4654),
                fontSize: 14,
                height: 1.5,
              ),
        ),
        const SizedBox(height: 16),

        AppButtonGroup(expand: true, children: [
          AppButton(
            height: 48,
            type: _selectedType == ChecknoteType.single
                ? ButtonType.secondaryA // 선택된 경우
                : ButtonType.text, // 선택되지 않은 경우
            text: '싱글 체크 노트',
            onPressed: () {
              setState(() {
                _selectedType = ChecknoteType.single;
              });
              widget.onTypeChanged(ChecknoteType.single);
            },
          ),
          AppButton(
            height: 48,
            type: _selectedType == ChecknoteType.multi
                ? ButtonType.secondaryA // 선택된 경우
                : ButtonType.text, // 선택되지 않은 경우
            text: '멀티 체크 노트',
            onPressed: () {
              setState(() {
                _selectedType = ChecknoteType.multi;
              });
              widget.onTypeChanged(ChecknoteType.multi);
            },
          ),
        ]),
        // // 유형 선택 버튼들
      ],
    );
  }
}
