import 'package:flutter/material.dart';
import 'app_text_field.dart';

class AppPasswordField extends StatefulWidget {
  const AppPasswordField({
    Key? key,
    this.controller,
    this.focusNode,
    this.hintText = '비밀번호',
    this.onChanged,
    this.onSubmitted,
    this.enabled = true,
    this.errorText,
  }) : super(key: key);

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final bool enabled;
  final String? errorText;

  @override
  State<AppPasswordField> createState() => _AppPasswordFieldState();
}

class _AppPasswordFieldState extends State<AppPasswordField> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      hintText: widget.hintText,
      enabled: widget.enabled,
      errorText: widget.errorText,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
      obscureText: _obscureText,
      keyboardType: TextInputType.visiblePassword,
      suffix: IconButton(
        onPressed: _togglePasswordVisibility,
        tooltip: _obscureText ? '비밀번호 보기' : '비밀번호 숨기기',
        icon: Icon(
          _obscureText ? Icons.visibility : Icons.visibility_off,
          size: 20,
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
        ),
        splashRadius: 24,
      ),
    );
  }
}
