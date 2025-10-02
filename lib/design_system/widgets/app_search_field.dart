import 'package:flutter/material.dart';
import 'app_text_field.dart';

class AppSearchField extends StatelessWidget {
  const AppSearchField({
    Key? key,
    this.controller,
    this.focusNode,
    this.hintText = '검색',
    this.onChanged,
    this.onSubmitted,
    this.onClear,
    this.enabled = true,
    this.errorText,
  }) : super(key: key);

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onClear;
  final bool enabled;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      focusNode: focusNode,
      hintText: hintText,
      enabled: enabled,
      errorText: errorText,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      prefix: Icon(
        Icons.search,
        size: 20,
        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
      ),
      suffix: controller?.text.isNotEmpty == true
          ? IconButton(
              onPressed: () {
                controller?.clear();
                onClear?.call();
                onChanged?.call('');
              },
              tooltip: '검색어 지우기',
              icon: Icon(
                Icons.close,
                size: 20,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
              ),
              splashRadius: 24,
            )
          : null,
    );
  }
}
