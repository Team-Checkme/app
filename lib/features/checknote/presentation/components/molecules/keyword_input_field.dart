import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 키워드 입력 필드 컴포넌트
class KeywordInputField extends ConsumerStatefulWidget {
  const KeywordInputField({
    super.key,
    required this.onKeywordAdded,
    required this.keywords,
    required this.onKeywordRemoved,
  });

  final Function(String) onKeywordAdded;
  final List<String> keywords;
  final Function(String) onKeywordRemoved;

  @override
  ConsumerState<KeywordInputField> createState() => _KeywordInputFieldState();
}

class _KeywordInputFieldState extends ConsumerState<KeywordInputField> {
  final _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _addKeyword() {
    final keyword = _controller.text.trim();
    if (keyword.isNotEmpty && _formKey.currentState!.validate()) {
      widget.onKeywordAdded(keyword);
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 키워드 입력 영역
        Row(
          children: [
            Expanded(
              child: Form(
                key: _formKey,
                child: TextFormField(
                  controller: _controller,
                  maxLength: 10,
                  decoration: InputDecoration(
                    hintText: '최대 10자까지 입력 가능해요.',
                    hintStyle: TextStyle(
                      color: const Color(0xFF191F2A).withOpacity(0.4),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Color(0xFFE1E5EA),
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Color(0xFFE1E5EA),
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Color(0xFF59B3FF),
                        width: 1,
                      ),
                    ),
                    contentPadding: const EdgeInsets.all(16),
                    counterText: '${_controller.text.length}/10',
                    counterStyle: TextStyle(
                      color: const Color(0xFF191F2A).withOpacity(0.4),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return '키워드를 입력해주세요.';
                    }
                    if (value.trim().length > 10) {
                      return '키워드는 10자를 초과할 수 없습니다.';
                    }
                    if (widget.keywords.contains(value.trim())) {
                      return '이미 추가된 키워드입니다.';
                    }
                    if (widget.keywords.length >= 10) {
                      return '키워드는 최대 10개까지 추가 가능합니다.';
                    }
                    return null;
                  },
                ),
              ),
            ),
            const SizedBox(width: 8),
            SizedBox(
              height: 48,
              child: ElevatedButton(
                onPressed: widget.keywords.length >= 10 ? null : _addKeyword,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFBDC7D1),
                  foregroundColor: const Color(0xFF8C96A2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  '추가',
                  style: TextStyle(
                    fontFamily: 'SUIT',
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        // 키워드 태그들
        if (widget.keywords.isNotEmpty)
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: widget.keywords.map((keyword) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFFECF4FB), // Figma 디자인에 맞는 배경색
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '#$keyword',
                      style: const TextStyle(
                        fontFamily: 'SUIT',
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: Color(0xFF616977), // Figma 디자인에 맞는 텍스트 색상
                      ),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () => widget.onKeywordRemoved(keyword),
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: const BoxDecoration(
                          color: Color(0xFF616977), // Figma 디자인에 맞는 X 아이콘 색상
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.close,
                          size: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
      ],
    );
  }
}
