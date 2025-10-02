import 'package:flutter/material.dart';
import '../../design_system/widgets/app_text_field.dart';
import '../../design_system/widgets/app_search_field.dart';
import '../../design_system/widgets/app_password_field.dart';

class InputDemoPage extends StatelessWidget {
  const InputDemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input 컴포넌트 데모'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 16),
          children: const [
            _Section(label: 'Default', child: AppTextField(hintText: 'Text')),
            SizedBox(height: 16),
            _Section(label: 'Focused', child: _FocusedField()),
            SizedBox(height: 16),
            _Section(label: 'Typing', child: _TypingField()),
            SizedBox(height: 16),
            _Section(label: 'Complete', child: _CompleteField()),
            SizedBox(height: 16),
            _Section(
                label: 'Disabled',
                child: AppTextField(hintText: 'Text', enabled: false)),
            SizedBox(height: 16),
            _Section(
                label: 'Error',
                child: AppTextField(hintText: 'Text', errorText: '오류 메시지입니다')),
            SizedBox(height: 32),
            _Section(
                label: 'Search Field',
                child: AppSearchField(hintText: '검색어를 입력하세요')),
            SizedBox(height: 16),
            _Section(
                label: 'Password Field',
                child: AppPasswordField(hintText: '비밀번호를 입력하세요')),
          ],
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.label, required this.child});
  final String label;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        const SizedBox(height: 8),
        child,
      ],
    );
  }
}

class _FocusedField extends StatefulWidget {
  const _FocusedField({Key? key}) : super(key: key);
  @override
  State<_FocusedField> createState() => _FocusedFieldState();
}

class _FocusedFieldState extends State<_FocusedField> {
  final _node = FocusNode();
  @override
  void initState() {
    super.initState();
    Future.microtask(() => _node.requestFocus());
  }

  @override
  void dispose() {
    _node.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AppTextField(
        focusNode: _node,
        hintText: '포커스된 상태',
      );
}

class _TypingField extends StatelessWidget {
  const _TypingField({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => AppTextField(
        controller: TextEditingController(text: '입력 중인 텍스트'),
        hintText: '입력 중',
      );
}

class _CompleteField extends StatelessWidget {
  const _CompleteField({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => const AppTextField(
        hintText: '완성된 텍스트',
        clearable: true,
      );
}
