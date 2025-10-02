import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 참여 인원 제한 선택 컴포넌트
class ParticipantLimitSelector extends ConsumerStatefulWidget {
  const ParticipantLimitSelector({
    super.key,
    required this.isUnlimited,
    required this.maxParticipants,
    required this.onUnlimitedChanged,
    required this.onMaxParticipantsChanged,
  });

  final bool isUnlimited;
  final int? maxParticipants;
  final ValueChanged<bool> onUnlimitedChanged;
  final ValueChanged<int?> onMaxParticipantsChanged;

  @override
  ConsumerState<ParticipantLimitSelector> createState() =>
      _ParticipantLimitSelectorState();
}

class _ParticipantLimitSelectorState
    extends ConsumerState<ParticipantLimitSelector> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.maxParticipants != null) {
      _controller.text = widget.maxParticipants.toString();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onUnlimitedChanged(bool value) {
    widget.onUnlimitedChanged(value);
    if (value) {
      widget.onMaxParticipantsChanged(null);
      _controller.clear();
    }
  }

  void _onMaxParticipantsChanged(String value) {
    final intValue = int.tryParse(value);
    widget.onMaxParticipantsChanged(intValue);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 제한 없음 버튼
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () => _onUnlimitedChanged(true),
            style: ElevatedButton.styleFrom(
              backgroundColor: widget.isUnlimited
                  ? const Color(0xFF59B3FF)
                  : const Color(0xFFBDC7D1),
              foregroundColor:
                  widget.isUnlimited ? Colors.white : const Color(0xFF8C96A2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            icon: Icon(
              Icons.all_inclusive,
              color:
                  widget.isUnlimited ? Colors.white : const Color(0xFF8C96A2),
            ),
            label: Text(
              '제한 없음',
              style: TextStyle(
                fontFamily: 'SUIT',
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color:
                    widget.isUnlimited ? Colors.white : const Color(0xFF8C96A2),
              ),
            ),
          ),
        ),

        const SizedBox(height: 16),

        // 직접 입력 필드
        Container(
          width: double.infinity,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: const Color(0xFFE1E5EA),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  enabled: !widget.isUnlimited,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    _LeadingZeroRemover(),
                  ],
                  onChanged: _onMaxParticipantsChanged,
                  decoration: const InputDecoration(
                    hintText: '직접 입력',
                    hintStyle: TextStyle(
                      color: Color(0xFF191F2A),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
              ),
              Container(
                width: 1,
                height: 16,
                color: const Color(0xFFBDC7D1),
              ),
              const SizedBox(width: 8),
              Text(
                '명',
                style: TextStyle(
                  color: const Color(0xFF191F2A),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 16),
            ],
          ),
        ),
      ],
    );
  }
}

/// 앞의 0을 제거하는 커스텀 TextInputFormatter
class _LeadingZeroRemover extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String newText = newValue.text;

    // 빈 문자열이면 그대로 반환
    if (newText.isEmpty) {
      return newValue;
    }

    // 앞의 0들을 제거하되, 0만 남은 경우는 0으로 유지
    String cleanedText = newText.replaceFirst(RegExp(r'^0+'), '');
    if (cleanedText.isEmpty) {
      cleanedText = '0';
    }

    return TextEditingValue(
      text: cleanedText,
      selection: TextSelection.collapsed(offset: cleanedText.length),
    );
  }
}
