import 'package:flutter/material.dart';
import '../../../../../design_system/widgets/app_enhanced_text_field.dart';

/// 체크 노트 이름 입력 필드 (Atom)
class ChecknoteNameField extends StatelessWidget {
  const ChecknoteNameField({
    super.key,
    required this.controller,
    required this.onChanged,
    this.errorText,
  });

  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return AppEnhancedTextField(
      label: '이름',
      controller: controller,
      hintText: '체크 노트 이름을 입력해 주세요(최소 5자)',
      errorText: errorText,
      maxLength: 50,
      required: true,
      onChanged: onChanged,
      textFieldType: TextFieldType.shortText,
      counterPosition: CounterPosition.outside,
      showCounter: true,
    );
  }
}
