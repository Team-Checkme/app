import 'package:app/design_system/widgets/app_button.dart';
import 'package:app/design_system/widgets/safe_scroll_area.dart';
import 'package:app/features/checknote/domain/entities/checknote_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/design_system/widgets/app_enhanced_text_field.dart';
import '../molecules/checknote_type_selector.dart';
import '../molecules/image_upload_area.dart';
import '../../providers/checknote_creation_provider.dart';

/// 체크 노트 생성 Step 1 (Organism)
class ChecknoteCreationStep1Form extends ConsumerStatefulWidget {
  const ChecknoteCreationStep1Form({
    super.key,
    required this.onSubmit,
  });

  final Function(String name, List<String> imageUrls, ChecknoteType type)
      onSubmit;

  @override
  ConsumerState<ChecknoteCreationStep1Form> createState() =>
      _ChecknoteCreationStep1FormState();
}

class _ChecknoteCreationStep1FormState
    extends ConsumerState<ChecknoteCreationStep1Form> {
  final _nameController = TextEditingController();
  final List<String> _imageUrls = [];
  String? _nameError;
  ChecknoteType _selectedType = ChecknoteType.single;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _onNameChanged(String value) {
    setState(() {
      _nameError = null;
    });
  }

  void _onTypeChanged(ChecknoteType type) {
    setState(() {
      _selectedType = type;
    });
  }

  void _onImageSelected() {
    // TODO: 실제 이미지 선택 로직 구현
    // 현재는 더미 이미지 URL 추가
    if (_imageUrls.length < 10) {
      setState(() {
        _imageUrls
            .add('https://picsum.photos/200/200?random=${_imageUrls.length}');
      });

      // provider에도 이미지 추가
      ref.read(checknoteCreationProvider.notifier).addImage(
            'https://picsum.photos/200/200?random=${_imageUrls.length - 1}',
          );
    }
  }

  void _onImageRemoved(int index) {
    setState(() {
      _imageUrls.removeAt(index);
    });

    // provider에서도 이미지 제거
    ref.read(checknoteCreationProvider.notifier).removeImage(index);
  }

  void _onSubmit() {
    final name = _nameController.text.trim();

    // 유효성 검사
    if (name.isEmpty) {
      setState(() {
        _nameError = '체크 노트 이름은 필수입니다.';
      });
      return;
    }

    if (name.length < 5) {
      setState(() {
        _nameError = '체크 노트 이름은 최소 5자 이상이어야 합니다.';
      });
      return;
    }

    if (name.length > 50) {
      setState(() {
        _nameError = '체크 노트 이름은 50자를 초과할 수 없습니다.';
      });
      return;
    }

    // provider에 데이터 저장
    ref.read(checknoteCreationProvider.notifier).updateStep1Data(
          name: name,
          imageUrls: _imageUrls,
          type: _selectedType,
        );

    widget.onSubmit(name, _imageUrls, _selectedType);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 메인 콘텐츠 (스크롤 가능)
        SafeScrollArea(
          padding: const EdgeInsets.only(bottom: 80), // 다음 버튼 공간 확보
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 체크 노트 유형 선택
              ChecknoteTypeSelector(
                onTypeChanged: _onTypeChanged,
                initialType: _selectedType,
              ),

              const SizedBox(height: 24),

              // 이름 입력 필드
              AppEnhancedTextField(
                label: '체크 노트 이름',
                controller: _nameController,
                hintText: '체크 노트 이름을 입력해주세요 (최소 5자)',
                errorText: _nameError,
                maxLength: 50,
                required: true,
                onChanged: _onNameChanged,
                textFieldType: TextFieldType.shortText,
                counterPosition: CounterPosition.outside,
                showCounter: true,
              ),

              const SizedBox(height: 24),

              // 이미지 업로드 영역
              ImageUploadArea(
                onImageSelected: _onImageSelected,
                onImageRemoved: _onImageRemoved,
                imageUrls: _imageUrls,
                title: '대표이미지',
                description:
                    '최대 10장까지 추가 가능하며, 첫 번째 대표 이미지는 체크 노트 목록에서 대표 썸네일로 제공됩니다.',
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),

        // 다음 버튼 (하단 고정)
        Positioned(
          bottom: 16,
          left: 0,
          right: 0,
          child: Container(
            color: Colors.white,
            // padding: const EdgeInsets.all(16),
            child: AppButton(
              type: ButtonType.primary,
              height: 48,
              text: '다음',
              onPressed: _onSubmit,
            ),
          ),
        ),
      ],
    );
  }
}
