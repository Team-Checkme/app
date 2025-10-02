import 'package:flutter/material.dart';
import '../tokens/input_theme.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    Key? key,
    this.controller,
    this.focusNode,
    this.hintText,
    this.enabled = true,
    this.clearable = true,
    this.errorText,
    this.keyboardType,
    this.textInputAction,
    this.obscureText = false,
    this.onChanged,
    this.onSubmitted,
    this.prefix,
    this.suffix,
    this.maxLength,
  }) : super(key: key);

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hintText;
  final bool enabled;
  final bool clearable;
  final String? errorText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final Widget? prefix;
  final Widget? suffix;
  final int? maxLength;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late final TextEditingController _controller =
      widget.controller ?? TextEditingController();
  late final FocusNode _focusNode = widget.focusNode ?? FocusNode();

  bool get _hasText => _controller.text.isNotEmpty;
  bool get _hasError => widget.errorText != null;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_rebuild);
    _focusNode.addListener(_rebuild);
  }

  @override
  void dispose() {
    if (widget.controller == null) _controller.dispose();
    if (widget.focusNode == null) _focusNode.dispose();
    _controller.removeListener(_rebuild);
    _focusNode.removeListener(_rebuild);
    super.dispose();
  }

  void _rebuild() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final tokens =
        Theme.of(context).extension<AppInputTheme>() ?? const AppInputTheme();

    final baseBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(tokens.radius),
      borderSide:
          BorderSide(width: tokens.borderWidth, color: scheme.outlineVariant),
    );
    final focusedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(tokens.radius),
      borderSide:
          BorderSide(width: tokens.focusedBorderWidth, color: scheme.primary),
    );
    final disabledBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(tokens.radius),
      borderSide: BorderSide(
          width: tokens.borderWidth,
          color: scheme.outlineVariant.withOpacity(0.4)),
    );
    final errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(tokens.radius),
      borderSide:
          BorderSide(width: tokens.focusedBorderWidth, color: scheme.error),
    );

    // 상태별 배경색
    final bool disabled = !widget.enabled;
    final Color? fillColor = _hasError
        ? scheme.error.withOpacity(0.08)
        : (disabled ? scheme.surfaceVariant.withOpacity(0.6) : scheme.surface);

    // 오류 메시지가 있을 때는 추가 높이 제공
    final double fieldHeight = _hasError
        ? tokens.minHeight + 20 // 오류 메시지 공간 추가
        : tokens.minHeight;

    return SizedBox(
      height: fieldHeight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: 200,
          minHeight: tokens.minHeight,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TextField 영역 (고정 높이)
            SizedBox(
              height: tokens.minHeight,
              child: TextField(
                controller: _controller,
                focusNode: _focusNode,
                enabled: widget.enabled,
                keyboardType: widget.keyboardType,
                textInputAction: widget.textInputAction,
                obscureText: widget.obscureText,
                maxLength: widget.maxLength,
                onChanged: widget.onChanged,
                onSubmitted: widget.onSubmitted,
                style: TextStyle(
                    color: disabled
                        ? scheme.onSurface.withOpacity(0.38)
                        : scheme.onSurface),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: fillColor,
                  hintText: widget.hintText,
                  hintStyle:
                      TextStyle(color: scheme.onSurface.withOpacity(0.6)),
                  contentPadding: tokens.contentPadding,
                  prefixIcon: widget.prefix,
                  suffixIcon:
                      widget.suffix ?? _buildClearButton(scheme, tokens),
                  enabledBorder: baseBorder,
                  focusedBorder: _hasError ? errorBorder : focusedBorder,
                  disabledBorder: disabledBorder,
                  errorBorder: errorBorder,
                  focusedErrorBorder: errorBorder,
                  // errorText는 별도로 표시
                ),
              ),
            ),
            // 오류 메시지 영역
            if (_hasError)
              Padding(
                padding: const EdgeInsets.only(top: 4, left: 12),
                child: Text(
                  widget.errorText!,
                  style: TextStyle(
                    color: scheme.error,
                    fontSize: 12,
                    height: 1.2,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget? _buildClearButton(ColorScheme scheme, AppInputTheme tokens) {
    final show = widget.clearable && widget.enabled && _hasText;
    if (!show) return null;

    return Padding(
      padding: EdgeInsets.only(right: tokens.contentPadding.horizontal / 2),
      child: IconButton(
        onPressed: () {
          _controller.clear();
          widget.onChanged?.call('');
        },
        tooltip: '지우기',
        icon: Icon(Icons.close,
            size: 20, color: scheme.onSurface.withOpacity(0.6)),
        splashRadius: 24, // 터치 타깃 48 보장(양쪽 패딩 포함)
      ),
    );
  }
}
