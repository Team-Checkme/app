import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/design_system/widgets/safe_scroll_area.dart';
import 'package:app/design_system/widgets/app_button.dart';
import 'package:app/design_system/widgets/app_enhanced_text_field.dart';
import 'package:app/constants/app_colors.dart';
import 'package:app/constants/app_typography.dart';
import 'package:app/constants/app_spacing.dart';
import '../molecules/image_upload_area.dart';
import '../../providers/checknote_creation_provider.dart';

/// 체크노트 생성 step2 폼 (Organism)
class ChecknoteCreationStep2Form extends ConsumerStatefulWidget {
  const ChecknoteCreationStep2Form({
    super.key,
    required this.onPrevious,
    required this.onNext,
  });

  final VoidCallback onPrevious;
  final VoidCallback onNext;

  @override
  ConsumerState<ChecknoteCreationStep2Form> createState() =>
      _ChecknoteCreationStep2FormState();
}

class _ChecknoteCreationStep2FormState
    extends ConsumerState<ChecknoteCreationStep2Form> {
  final _descriptionController = TextEditingController();
  String? _descriptionError;
  String? _pressedKeyword; // 길게 누른 키워드 추적

  @override
  void initState() {
    super.initState();

    // 키워드 컨트롤러에 리스너 추가
    _keywordController.addListener(_onKeywordControllerChanged);

    // provider에서 기존 데이터 로드
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final state = ref.read(checknoteCreationProvider);
      if (state.description != null && state.description!.isNotEmpty) {
        _descriptionController.text = state.description!;
      }
      if (state.maxParticipants != null) {
        _participantController.text = state.maxParticipants.toString();
      }
    });
  }

  void _onDescriptionChanged(String value) {
    setState(() {
      _descriptionError = null;
    });

    // provider에 설명 업데이트
    ref.read(checknoteCreationProvider.notifier).updateStep2Data(
          description: value.trim(),
        );
  }

  final _keywordController = TextEditingController();
  final _participantController = TextEditingController();

  @override
  void dispose() {
    _keywordController.removeListener(_onKeywordControllerChanged);
    _descriptionController.dispose();
    _keywordController.dispose();
    _participantController.dispose();
    super.dispose();
  }

  void _onKeywordAdded(String keyword) {
    ref.read(checknoteCreationProvider.notifier).addKeyword(keyword);
  }

  void _onKeywordRemoved(String keyword) {
    ref.read(checknoteCreationProvider.notifier).removeKeyword(keyword);
  }

  void _onKeywordControllerChanged() {
    // 키워드 컨트롤러 변경 시 setState 호출
    setState(() {});
  }

  void _addKeyword() {
    final keyword = _keywordController.text.trim();
    if (keyword.isNotEmpty && keyword.length <= 10) {
      final state = ref.read(checknoteCreationProvider);
      if (!state.keywords.contains(keyword) && state.keywords.length < 10) {
        _onKeywordAdded(keyword);
        _keywordController.clear();
        // clear() 후 즉시 setState 호출하여 UI 업데이트
        setState(() {});
      }
    }
  }

  void _onImageSelected() {
    // TODO: 실제 이미지 선택 로직 구현
    final currentState = ref.read(checknoteCreationProvider);
    if (currentState.imageUrls.length < 10) {
      ref.read(checknoteCreationProvider.notifier).addImage(
            'https://picsum.photos/200/200?random=${currentState.imageUrls.length}',
          );
    }
  }

  void _onImageRemoved(int index) {
    ref.read(checknoteCreationProvider.notifier).removeImage(index);
  }

  void _onUnlimitedChanged(bool value) {
    ref.read(checknoteCreationProvider.notifier).updateStep2Data(
          isUnlimitedParticipants: value,
        );
    if (value) {
      _participantController.clear();
    }
  }

  void _onMaxParticipantsChanged(String value) {
    final intValue = int.tryParse(value);
    ref.read(checknoteCreationProvider.notifier).updateStep2Data(
          maxParticipants: intValue,
        );
  }

  void _onNext() {
    final description = _descriptionController.text.trim();

    // 유효성 검사
    if (description.isEmpty) {
      setState(() {
        _descriptionError = '체크노트 소개는 필수입니다.';
      });
      return;
    }

    if (description.length > 500) {
      setState(() {
        _descriptionError = '체크노트 소개는 500자를 초과할 수 없습니다.';
      });
      return;
    }

    // provider에 최종 데이터 업데이트
    ref.read(checknoteCreationProvider.notifier).updateStep2Data(
          description: description,
        );

    // 다음 step으로 이동
    ref.read(checknoteCreationProvider.notifier).nextStep();
    widget.onNext();
  }

  /// 소개 입력 필드 위젯
  Widget _buildDescriptionField() {
    return AppEnhancedTextField(
      label: '소개',
      controller: _descriptionController,
      hintText: '체크 노트를 소개하는 내용을 입력해 주세요(최소 10자)',
      errorText: _descriptionError,
      maxLength: 500,
      required: true,
      onChanged: _onDescriptionChanged,
      textFieldType: TextFieldType.longText,
      counterPosition: CounterPosition.inside,
      fixedHeight: 120, // Figma 디자인에 맞춰 고정 높이
      textInputAction: TextInputAction.newline,
    );
  }

  /// 키워드 입력 필드 위젯
  Widget _buildKeywordField(dynamic state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 제목
        Text(
          '키워드',
          style: AppTypography.body16EB.copyWith(
            color: AppColors.gray900,
          ),
        ),
        const SizedBox(height: AppSpacing.s8),

        // 설명
        Text(
          '체크 노트를 가장 잘 표현하는 키워드를 입력해 주세요. 최대 10개까지 추가 가능합니다.',
          style: AppTypography.body14M.copyWith(
            color: AppColors.gray800,
          ),
        ),
        const SizedBox(height: AppSpacing.s16),

        // 입력 필드와 버튼 (수평 정렬)
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: AppEnhancedTextField(
                maxHeight: 48,
                label: '', // 라벨 없음
                controller: _keywordController,
                hintText: '최대 10자까지 입력 가능해요.',
                maxLength: 10,
                textFieldType: TextFieldType.shortText,
                counterPosition: CounterPosition.none, // 카운터 숨김
                textInputAction: TextInputAction.done,
                showTitle: false, // 라벨과 간격 완전 제거
              ),
            ),
            const SizedBox(width: AppSpacing.s8),
            Builder(
              builder: (context) {
                final state = ref.watch(checknoteCreationProvider);
                final currentText = _keywordController.text.trim();
                final canAdd = currentText.isNotEmpty &&
                    currentText.length <= 10 &&
                    !state.keywords.contains(currentText) &&
                    state.keywords.length < 10;

                return AppButton(
                  type: canAdd ? ButtonType.primary : ButtonType.primary,
                  text: '추가',
                  onPressed: canAdd ? _addKeyword : null,
                  height: 48, // 텍스트필드와 동일한 높이
                );
              },
            ),
          ],
        ),

        // 키워드 태그들
        if (state.keywords.isNotEmpty) ...[
          const SizedBox(height: AppSpacing.s16),
          Wrap(
            spacing: AppSpacing.s8,
            runSpacing: AppSpacing.s8,
            children: state.keywords.map<Widget>((keyword) {
              final bool isPressed = _pressedKeyword == keyword;
              return GestureDetector(
                onTapDown: (_) {
                  setState(() {
                    _pressedKeyword = keyword;
                  });
                },
                onTapUp: (_) {
                  setState(() {
                    _pressedKeyword = null;
                  });
                },
                onTapCancel: () {
                  setState(() {
                    _pressedKeyword = null;
                  });
                },
                onLongPressStart: (_) {
                  setState(() {
                    _pressedKeyword = keyword;
                  });
                },
                onLongPressEnd: (_) {
                  setState(() {
                    _pressedKeyword = null;
                  });
                },
                onLongPressCancel: () {
                  setState(() {
                    _pressedKeyword = null;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.s8,
                    vertical: AppSpacing.s8,
                  ),
                  decoration: BoxDecoration(
                    color: isPressed
                        ? const Color(0x14000000) // rgba(0, 0, 0, 0.08)
                        : const Color(0xFFECF4FB),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '#$keyword',
                        style: AppTypography.body14B.copyWith(
                          color: const Color(0xFF616977),
                        ),
                      ),
                      const SizedBox(width: AppSpacing.s4),
                      GestureDetector(
                        onTap: () => _onKeywordRemoved(keyword),
                        child: Container(
                          width: 16,
                          height: 16,
                          decoration: const BoxDecoration(
                            color: Color(0xFF616977),
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
                ),
              );
            }).toList(),
          ),
        ],
      ],
    );
  }

  /// 참여 인원 설정 필드 위젯
  Widget _buildParticipantField(dynamic state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 제목
        Row(
          children: [
            Text(
              '참여 인원',
              style: AppTypography.body16EB.copyWith(
                color: AppColors.gray900,
              ),
            ),
            const SizedBox(width: AppSpacing.s4),
            Text(
              '*',
              style: AppTypography.body16EB.copyWith(
                color: AppColors.error,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.s8),

        // 설명
        Text(
          '참여 인원은 체크 노트가 만들어진 후에도 수정 가능합니다.',
          style: AppTypography.body14M.copyWith(
            color: AppColors.gray800,
          ),
        ),
        const SizedBox(height: AppSpacing.s16),

        // 제한 없음 버튼과 직접 입력 필드 (좌우 배치)
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 제한 없음 버튼
            AppButton(
              type: state.isUnlimitedParticipants
                  ? ButtonType.secondaryA
                  : ButtonType.secondaryB,
              text: '제한 없음',
              onPressed: () =>
                  _onUnlimitedChanged(!state.isUnlimitedParticipants),
              height: 48,
              textColor: state.isUnlimitedParticipants
                  ? AppColors.white
                  : AppColors.gray500,
              icon: Icon(
                Icons.all_inclusive,
                size: 16,
                color: state.isUnlimitedParticipants
                    ? AppColors.white
                    : AppColors.gray500,
              ),
            ),
            const SizedBox(width: AppSpacing.s8),

            // 직접 입력 필드
            Expanded(
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  color: state.isUnlimitedParticipants
                      ? AppColors.gray200 // #E1E5EA (비활성화 상태)
                      : Colors.white, // #FFFFFF (활성화 상태)
                  border: Border.all(
                    color: state.isUnlimitedParticipants
                        ? AppColors.gray200 // 비활성화 상태에서는 배경과 같은 색
                        : AppColors.gray200, // 활성화 상태에서는 테두리 색
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    // "직접입력" 고정 라벨
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.s16,
                        vertical: AppSpacing.s12,
                      ),
                      child: Text(
                        '직접입력',
                        style: AppTypography.body14M.copyWith(
                          color: state.isUnlimitedParticipants
                              ? AppColors.gray900.withOpacity(0.4) // 비활성화 상태
                              : AppColors.gray300, // 활성화 상태
                        ),
                      ),
                    ),
                    // 세로 구분선
                    Container(
                      width: 1,
                      height: 16,
                      color: state.isUnlimitedParticipants
                          ? AppColors.gray300 // 비활성화 상태
                          : AppColors.gray300, // 활성화 상태
                    ),
                    // 실제 텍스트 입력 영역
                    Expanded(
                      child: TextField(
                        controller: _participantController,
                        enabled: !state.isUnlimitedParticipants,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          _LeadingZeroRemover(),
                        ],
                        onChanged: _onMaxParticipantsChanged,
                        style: AppTypography.body14M.copyWith(
                          color: AppColors.gray900,
                        ),
                        decoration: InputDecoration(
                          hintText: '',
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.s8,
                            vertical: AppSpacing.s12,
                          ),
                        ),
                      ),
                    ),
                    // "명" 단위
                    Container(
                      padding: const EdgeInsets.only(right: AppSpacing.s16),
                      child: Text(
                        '명',
                        style: AppTypography.body14M.copyWith(
                          color: state.isUnlimitedParticipants
                              ? AppColors.gray900.withOpacity(0.4) // 비활성화 상태
                              : AppColors.gray900.withOpacity(0.4), // 활성화 상태
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(checknoteCreationProvider);

    return Stack(
      children: [
        // 메인 콘텐츠 (스크롤 가능)
        SafeScrollArea(
          padding: const EdgeInsets.only(bottom: 80), // 버튼 공간 확보
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 소개 입력 필드
              _buildDescriptionField(),

              const SizedBox(height: AppSpacing.s24),

              // 이미지 첨부 영역
              ImageUploadArea(
                onImageSelected: _onImageSelected,
                onImageRemoved: _onImageRemoved,
                imageUrls: state.imageUrls,
                title: null, // 제목 없음
                description: '이미지 첨부는 선택 항목이며, 최대 10장 추가 가능합니다.',
              ),

              const SizedBox(height: AppSpacing.s24),

              // 키워드 입력 영역
              _buildKeywordField(state),

              const SizedBox(height: AppSpacing.s24),

              // 참여 인원 설정
              _buildParticipantField(state),

              const SizedBox(height: AppSpacing.s32),
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
                    height: 48, // Figma 디자인에 맞춰 48px 높이
                  ),
                ),
                const SizedBox(width: AppSpacing.s8),
                Expanded(
                  child: AppButton(
                    type: ButtonType.primary,
                    text: '미리보기',
                    onPressed: _onNext,
                    height: 48, // Figma 디자인에 맞춰 48px 높이
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
