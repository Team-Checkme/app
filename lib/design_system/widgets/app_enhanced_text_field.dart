import 'package:app/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_spacing.dart';
import '../../constants/app_typography.dart';

/// TextField 타입 열거형
enum TextFieldType {
  shortText, // 단문 (고정 높이)
  longText, // 장문 (확장 가능)
}

/// Counter 위치 열거형
enum CounterPosition {
  inside, // TextField 내부
  outside, // TextField 외부
  none, // 카운터 없음
}

/// TextField 상태 열거형
enum TextFieldState {
  normal, // 기본
  focused, // 포커싱
  typing, // 작성중
  completed, // 작성완료
  disabled, // 비활성
  error, // 에러
}

/// 피그마 디자인 기반 향상된 TextField 컴포넌트
class AppEnhancedTextField extends StatefulWidget {
  const AppEnhancedTextField({
    super.key,
    required this.label,
    required this.controller,
    this.hintText,
    this.errorText,
    this.maxLength,
    this.required = false,
    this.onChanged,

    // TextField 타입
    this.textFieldType = TextFieldType.shortText,

    // Counter 관련
    this.counterPosition = CounterPosition.outside,
    this.showCounter = true,

    // 높이 관련
    this.fixedHeight,
    this.minHeight,
    this.maxHeight,
    this.expandable = false,

    // 기타
    this.keyboardType,
    this.textInputAction,
    this.enabled = true,
    this.clearable = true,
    this.prefix,
    this.suffix,

    // 상태 관련
    this.showSuccessIcon = false,
    this.onStateChanged,
    this.showTitle = true,
  });

  final String label;
  final TextEditingController controller;
  final String? hintText;
  final String? errorText;
  final int? maxLength;
  final bool required;
  final ValueChanged<String>? onChanged;

  // TextField 타입
  final TextFieldType textFieldType;

  // Counter 관련
  final CounterPosition counterPosition;
  final bool showCounter;

  // 높이 관련
  final double? fixedHeight;
  final double? minHeight;
  final double? maxHeight;
  final bool expandable;

  // 기타
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool enabled;
  final bool clearable;
  final Widget? prefix;
  final Widget? suffix;

  // 상태 관련
  final bool showSuccessIcon;
  final ValueChanged<TextFieldState>? onStateChanged;
  final bool showTitle;

  @override
  State<AppEnhancedTextField> createState() => _AppEnhancedTextFieldState();
}

class _AppEnhancedTextFieldState extends State<AppEnhancedTextField> {
  late final FocusNode _focusNode = FocusNode();
  late final TextEditingController _controller;

  TextFieldState _currentState = TextFieldState.normal;
  bool _hasText = false;
  bool _hasError = false;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
    _controller.addListener(_updateState);
    _focusNode.addListener(_updateState);
    _updateState();
  }

  @override
  void didUpdateWidget(AppEnhancedTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    // errorText가 외부에서 변경될 때 즉시 상태 업데이트
    if (oldWidget.errorText != widget.errorText) {
      _updateState();
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_updateState);
    _focusNode.dispose();
    super.dispose();
  }

  void _updateState() {
    final hasText = _controller.text.isNotEmpty;
    final hasError = widget.errorText != null;
    final isFocused = _focusNode.hasFocus;

    TextFieldState newState;

    if (!widget.enabled) {
      newState = TextFieldState.disabled;
    } else if (hasError) {
      newState = TextFieldState.error;
    } else if (isFocused) {
      if (hasText) {
        newState = TextFieldState.typing;
      } else {
        newState = TextFieldState.focused;
      }
    } else if (hasText) {
      newState = TextFieldState.completed;
    } else {
      newState = TextFieldState.normal;
    }

    if (newState != _currentState ||
        hasText != _hasText ||
        hasError != _hasError ||
        isFocused != _isFocused) {
      if (mounted) {
        setState(() {
          _currentState = newState;
          _hasText = hasText;
          _hasError = hasError;
          _isFocused = isFocused;
        });
      }

      widget.onStateChanged?.call(_currentState);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 라벨과 필수 표시 (showTitle이 true일 때만)
        if (widget.showTitle) ...[
          _buildLabel(),
          const SizedBox(height: AppSpacing.s16),
        ],

        // 입력 필드
        _buildTextField(),

        // 외부 카운터와 에러 메시지를 같은 라인에 배치
        if (widget.showCounter &&
            widget.counterPosition == CounterPosition.outside) ...[
          const SizedBox(height: AppSpacing.s4),
          _buildBottomRow(),
        ],
      ],
    );
  }

  Widget _buildLabel() {
    return Row(
      children: [
        Text(
          widget.label,
          style: AppTypography.body16EB.copyWith(
            color: AppColors.gray900,
          ),
        ),
        if (widget.required) ...[
          const SizedBox(width: AppSpacing.s4),
          Text(
            '*',
            style: AppTypography.body16EB.copyWith(
              color: AppColors.error,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildTextField() {
    final isLongText = widget.textFieldType == TextFieldType.longText;
    final height = _calculateHeight();

    if (isLongText && widget.counterPosition == CounterPosition.inside) {
      // 장문 + 내부 카운터
      return Container(
        height: height,
        decoration: _getBoxDecoration(),
        child: Stack(
          children: [
            _buildInputField(isLongText),
            _buildInsideCounter(),
          ],
        ),
      );
    } else {
      // 단문 또는 외부 카운터
      return Container(
        height: height,
        decoration: _getBoxDecoration(),
        child: _buildInputField(isLongText),
      );
    }
  }

  Widget _buildInputField(bool isLongText) {
    return TextField(
      controller: _controller,
      focusNode: _focusNode,
      enabled: widget.enabled,
      keyboardType: isLongText ? TextInputType.multiline : widget.keyboardType,
      textInputAction: widget.textInputAction,
      maxLines: isLongText ? null : 1,
      // maxLength를 null로 설정하여 Flutter의 자동 counter 비활성화
      maxLength: null,
      textAlignVertical: TextAlignVertical.center, // 텍스트를 수직 중앙에 정렬
      inputFormatters: [
        if (widget.maxLength != null)
          LengthLimitingTextInputFormatter(widget.maxLength),
      ],
      onChanged: widget.onChanged,
      style: _getTextStyle(),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: _getHintStyle(),
        border: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.s16, vertical: AppSpacing.s12),
        prefixIcon: widget.prefix,
        suffixIcon: _buildSuffixIcon(),
        isCollapsed: false,
      ),
    );
  }

  Widget? _buildSuffixIcon() {
    if (!widget.enabled) return null;

    switch (_currentState) {
      case TextFieldState.typing:
      case TextFieldState.error:
      case TextFieldState.completed:
        return _buildClearButton(); // 에러 상태에서도 텍스트가 있으면 X 버튼 표시
      default:
        return null;
    }
  }

  Widget? _buildClearButton() {
    if (!widget.clearable || !_hasText) return null;

    return SizedBox(
      width: 44, // 터치 영역 44x44 보장
      height: 44,
      child: IconButton(
        onPressed: () {
          _controller.clear();
          widget.onChanged?.call('');
        },
        tooltip: '지우기',
        icon: SvgPicture.asset(
          AppIcons.closeFilled,
          width: 18,
          height: 18,
          colorFilter: const ColorFilter.mode(AppColors.black, BlendMode.srcIn),
        ),
      ),
    );
  }

  // Widget _buildSuccessIcon() {
  //   return Container(
  //     width: 44,
  //     height: 44,
  //     child: Icon(
  //       Icons.check_circle,
  //       size: 16,
  //       color: AppColors.success,
  //     ),
  //   );
  // }

  Widget _buildInsideCounter() {
    if (!widget.showCounter || widget.maxLength == null) {
      return const SizedBox.shrink();
    }

    return Positioned(
      right: 16,
      bottom: 8,
      child: Text(
        '${_controller.text.length}/${widget.maxLength}',
        style: AppTypography.caption12M.copyWith(
          color: AppColors.gray900.withOpacity(0.4),
        ),
      ),
    );
  }

  Widget _buildBottomRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // 에러 메시지 (왼쪽)
        if (widget.errorText != null)
          Flexible(
            child: _buildErrorMessage(),
          )
        else
          const SizedBox.shrink(),

        // 카운터 (오른쪽)
        if (widget.showCounter && widget.maxLength != null)
          _buildOutsideCounter()
        else
          const SizedBox.shrink(),
      ],
    );
  }

  Widget _buildOutsideCounter() {
    if (!widget.showCounter || widget.maxLength == null) {
      return const SizedBox.shrink();
    }

    return Container(
      constraints: const BoxConstraints(minWidth: 60), // 카운터 최소 너비 보장
      child: Text(
        '${_controller.text.length}/${widget.maxLength}',
        style: AppTypography.caption12M.copyWith(
          color: AppColors.gray900.withOpacity(0.4),
        ),
        textAlign: TextAlign.right, // 우측 정렬
      ),
    );
  }

  Widget _buildErrorMessage() {
    return Text(
      widget.errorText!,
      style: AppTypography.caption12M.copyWith(
        color: AppColors.error,
      ),
      overflow: TextOverflow.ellipsis, // 긴 텍스트는 ... 처리
      maxLines: 2, // 최대 2줄까지만 표시
    );
  }

  BoxDecoration _getBoxDecoration() {
    return BoxDecoration(
      color: _getBackgroundColor(),
      border: Border.all(
        color: _getBorderColor(),
        width: _getBorderWidth(),
      ),
      borderRadius: BorderRadius.circular(AppSpacing.s8),
    );
  }

  Color _getBackgroundColor() {
    switch (_currentState) {
      case TextFieldState.normal:
      case TextFieldState.focused:
      case TextFieldState.typing:
      case TextFieldState.completed:
        return Colors.white;
      case TextFieldState.disabled:
        return AppColors.gray100;
      case TextFieldState.error:
        return AppColors.error.withOpacity(0.08);
    }
  }

  Color _getBorderColor() {
    switch (_currentState) {
      case TextFieldState.normal:
      case TextFieldState.completed:
        return AppColors.gray200;
      case TextFieldState.focused:
      case TextFieldState.typing:
        return AppColors.gray700; // 피그마 디자인: 포커스와 타이핑 모두 #616977
      case TextFieldState.disabled:
        return AppColors.gray200.withOpacity(0.4);
      case TextFieldState.error:
        return AppColors.error;
    }
  }

  double _getBorderWidth() {
    switch (_currentState) {
      case TextFieldState.focused:
      case TextFieldState.typing:
      case TextFieldState.error:
        return 2.0;
      default:
        return 1.0;
    }
  }

  TextStyle _getTextStyle() {
    if (!widget.enabled) {
      return AppTypography.body14M.copyWith(
        color: AppColors.gray500.withOpacity(0.6),
      );
    }

    return AppTypography.body14M.copyWith(
      color: AppColors.gray900,
    );
  }

  TextStyle _getHintStyle() {
    return AppTypography.body14M.copyWith(
      color: AppColors.gray900.withOpacity(0.4),
      height: 1.4, // lineHeight를 1.0으로 설정하여 수직 중앙 정렬 개선
    );
  }

  double _calculateHeight() {
    if (widget.fixedHeight != null) {
      return widget.fixedHeight!;
    }

    if (widget.textFieldType == TextFieldType.shortText) {
      return widget.minHeight ?? 48.0;
    } else {
      // 장문: 최소 80, 최대 제한 없음 (확장 가능)
      return widget.minHeight ?? 80.0;
    }
  }
}
