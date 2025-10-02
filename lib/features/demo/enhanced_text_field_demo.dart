import 'package:flutter/material.dart';
import '../../design_system/widgets/app_enhanced_text_field.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_spacing.dart';

/// AppEnhancedTextField 데모 화면
class EnhancedTextFieldDemo extends StatefulWidget {
  const EnhancedTextFieldDemo({super.key});

  @override
  State<EnhancedTextFieldDemo> createState() => _EnhancedTextFieldDemoState();
}

class _EnhancedTextFieldDemoState extends State<EnhancedTextFieldDemo> {
  final TextEditingController _shortTextController = TextEditingController();
  final TextEditingController _longTextController = TextEditingController();
  final TextEditingController _errorController = TextEditingController();
  final TextEditingController _disabledController = TextEditingController();

  String? _shortTextError;
  String? _longTextError;
  bool _hasValidatedShortText = false;
  bool _hasValidatedLongText = false;

  @override
  void initState() {
    super.initState();
    // 실시간 검증 제거 - 검증 버튼을 눌러야만 에러 표시
  }

  @override
  void dispose() {
    _shortTextController.dispose();
    _longTextController.dispose();
    _errorController.dispose();
    _disabledController.dispose();
    super.dispose();
  }

  void _validateShortText() {
    print(
        '🔍 단문 검증 시작: "${_shortTextController.text}" (${_shortTextController.text.length}자)');
    setState(() {
      _hasValidatedShortText = true;
      if (_shortTextController.text.isEmpty) {
        _shortTextError = '이름을 입력해주세요';
        print('❌ 검증 실패: 빈 값');
      } else if (_shortTextController.text.length < 5) {
        _shortTextError = '최소 5자 이상 입력해주세요';
        print('❌ 검증 실패: ${_shortTextController.text.length}자 (최소 5자 필요)');
      } else {
        _shortTextError = null;
        print('✅ 검증 성공: ${_shortTextController.text.length}자');
      }
    });
  }

  void _validateLongText() {
    print(
        '🔍 장문 검증 시작: "${_longTextController.text}" (${_longTextController.text.length}자)');
    setState(() {
      _hasValidatedLongText = true;
      if (_longTextController.text.isEmpty) {
        _longTextError = '설명을 입력해주세요';
        print('❌ 검증 실패: 빈 값');
      } else if (_longTextController.text.length < 10) {
        _longTextError =
            '최소 10자 이상 입력해주세요. 현재 ${_longTextController.text.length}자입니다.';
        print('❌ 검증 실패: ${_longTextController.text.length}자 (최소 10자 필요)');
      } else {
        _longTextError = null;
        print('✅ 검증 성공: ${_longTextController.text.length}자');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enhanced TextField Demo'),
        backgroundColor: AppColors.blue500,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.s16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 제목
            Text(
              'AppEnhancedTextField 데모',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppColors.gray900,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: AppSpacing.s24),

            // 1. 단문 TextField (외부 카운터)
            _buildSectionTitle('1. 단문 TextField (외부 카운터)'),
            AppEnhancedTextField(
              label: '이름',
              controller: _shortTextController,
              hintText: '이름을 입력해주세요 (최소 5자)',
              errorText: _hasValidatedShortText ? _shortTextError : null,
              maxLength: 20,
              required: true,
              onChanged: (value) {
                print('단문 입력: $value');
              },
              textFieldType: TextFieldType.shortText,
              counterPosition: CounterPosition.outside,
              showCounter: true,
            ),
            const SizedBox(height: AppSpacing.s8),
            Row(
              children: [
                ElevatedButton(
                  onPressed: _validateShortText,
                  child: const Text('이름 검증 (최소 5자)'),
                ),
                const SizedBox(width: AppSpacing.s8),
                if (_hasValidatedShortText && _shortTextError == null)
                  Icon(Icons.check_circle, color: AppColors.success, size: 20),
                if (_hasValidatedShortText && _shortTextError != null)
                  Icon(Icons.error, color: AppColors.error, size: 20),
              ],
            ),
            if (_hasValidatedShortText && _shortTextError != null)
              Padding(
                padding: const EdgeInsets.only(top: AppSpacing.s8),
                child: Text(
                  '검증 결과: ${_shortTextError}',
                  style: TextStyle(color: AppColors.error, fontSize: 12),
                ),
              ),
            const SizedBox(height: AppSpacing.s32),

            // 2. 장문 TextField (내부 카운터)
            _buildSectionTitle('2. 장문 TextField (내부 카운터)'),
            AppEnhancedTextField(
              label: '설명',
              controller: _longTextController,
              hintText: '상세한 설명을 입력해주세요 (최소 10자)',
              errorText: _hasValidatedLongText ? _longTextError : null,
              maxLength: 200,
              onChanged: (value) {
                print('장문 입력: $value');
              },
              textFieldType: TextFieldType.longText,
              counterPosition: CounterPosition.inside,
              showCounter: true,
              minHeight: 120,
            ),
            const SizedBox(height: AppSpacing.s8),
            Row(
              children: [
                ElevatedButton(
                  onPressed: _validateLongText,
                  child: const Text('설명 검증 (최소 10자)'),
                ),
                const SizedBox(width: AppSpacing.s8),
                if (_hasValidatedLongText && _longTextError == null)
                  Icon(Icons.check_circle, color: AppColors.success, size: 20),
                if (_hasValidatedLongText && _longTextError != null)
                  Icon(Icons.error, color: AppColors.error, size: 20),
              ],
            ),
            if (_hasValidatedLongText && _longTextError != null)
              Padding(
                padding: const EdgeInsets.only(top: AppSpacing.s8),
                child: Text(
                  '검증 결과: ${_longTextError}',
                  style: TextStyle(color: AppColors.error, fontSize: 12),
                ),
              ),
            const SizedBox(height: AppSpacing.s32),

            // 3. 에러 상태 TextField
            _buildSectionTitle('3. 에러 상태 TextField'),
            AppEnhancedTextField(
              label: '에러 예시',
              controller: _errorController,
              hintText: '에러가 발생하는 입력 필드',
              errorText: null, // 에러 상태는 실제 검증 후에만 표시
              maxLength: 50,
              onChanged: (value) {
                print('에러 입력: $value');
              },
              textFieldType: TextFieldType.shortText,
              counterPosition: CounterPosition.outside,
              showCounter: true,
            ),
            const SizedBox(height: AppSpacing.s32),

            // 4. 비활성화 상태 TextField
            _buildSectionTitle('4. 비활성화 상태 TextField'),
            AppEnhancedTextField(
              label: '비활성화',
              controller: _disabledController,
              hintText: '이 필드는 비활성화되어 있습니다',
              maxLength: 50,
              enabled: false,
              textFieldType: TextFieldType.shortText,
              counterPosition: CounterPosition.outside,
              showCounter: true,
            ),
            const SizedBox(height: AppSpacing.s32),

            // 5. 성공 아이콘 표시 TextField
            _buildSectionTitle('5. 성공 아이콘 표시 TextField'),
            AppEnhancedTextField(
              label: '성공 아이콘',
              controller: TextEditingController(text: '완료된 텍스트'),
              hintText: '성공 아이콘이 표시됩니다',
              maxLength: 50,
              onChanged: (value) {
                print('성공 입력: $value');
              },
              textFieldType: TextFieldType.shortText,
              counterPosition: CounterPosition.outside,
              showCounter: true,
              showSuccessIcon: true,
            ),
            const SizedBox(height: AppSpacing.s32),

            // 6. 접두사/접미사 아이콘 TextField
            _buildSectionTitle('6. 접두사/접미사 아이콘 TextField'),
            AppEnhancedTextField(
              label: '아이콘 포함',
              controller: TextEditingController(),
              hintText: '접두사와 접미사 아이콘이 포함된 필드',
              maxLength: 50,
              onChanged: (value) {
                print('아이콘 입력: $value');
              },
              textFieldType: TextFieldType.shortText,
              counterPosition: CounterPosition.outside,
              showCounter: true,
              prefix: Icon(Icons.person, color: AppColors.gray500),
              suffix: Icon(Icons.info, color: AppColors.blue500),
            ),
            const SizedBox(height: AppSpacing.s32),

            // 상태 변경 콜백 예시
            _buildSectionTitle('7. 상태 변경 콜백 예시'),
            Container(
              padding: const EdgeInsets.all(AppSpacing.s16),
              decoration: BoxDecoration(
                color: AppColors.gray100,
                borderRadius: BorderRadius.circular(AppSpacing.s8),
                border: Border.all(color: AppColors.gray200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '현재 상태:',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppColors.gray900,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: AppSpacing.s8),
                  AppEnhancedTextField(
                    label: '상태 추적',
                    controller: TextEditingController(),
                    hintText: '입력해보세요',
                    maxLength: 30,
                    onChanged: (value) {
                      print('상태 추적 입력: $value');
                    },
                    onStateChanged: (state) {
                      print('TextField 상태 변경: $state');
                      setState(() {});
                    },
                    textFieldType: TextFieldType.shortText,
                    counterPosition: CounterPosition.outside,
                    showCounter: true,
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppSpacing.s32),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.s16),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: AppColors.gray800,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
