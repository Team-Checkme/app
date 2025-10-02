# Design System Widgets

이 디렉토리는 앱 전체에서 재사용 가능한 공통 위젯들을 포함합니다.

## 📝 TextField Components

### AppTextField

기본적인 TextField 컴포넌트로, Material Design 가이드라인을 따릅니다.

**주요 기능:**

- 기본 테두리 스타일
- 포커스/에러 상태 관리
- Clear 버튼 지원
- 접두사/접미사 아이콘 지원

**사용 예시:**

```dart
AppTextField(
  controller: controller,
  hintText: '입력해주세요',
  onChanged: (value) => print(value),
)
```

### AppEnhancedTextField ⭐ **NEW**

피그마 디자인을 기반으로 한 향상된 TextField 컴포넌트로, 모든 상태값과 다양한 사용 케이스를 지원합니다.

**주요 기능:**

- **상태별 스타일**: 기본, 포커싱, 작성중, 작성완료, 비활성, 에러
- **타입별 차이**: 단문(고정 높이) vs 장문(확장 가능)
- **Counter 위치**: 내부 vs 외부
- **동적 높이**: 내용에 따른 자동 확장
- **상태 추적**: 실시간 상태 변경 콜백
- **접근성**: 터치 영역 44x44 보장
- **입력 제한**: maxLength 설정 시 자동으로 입력 차단
- **검증 방식**: 에러는 검증 버튼 클릭 시에만 표시

**Props:**

```dart
AppEnhancedTextField({
  required String label,
  required TextEditingController controller,
  String? hintText,
  String? errorText,
  int? maxLength,
  bool required = false,
  ValueChanged<String>? onChanged,

  // TextField 타입
  TextFieldType textFieldType = TextFieldType.shortText,

  // Counter 관련
  CounterPosition counterPosition = CounterPosition.outside,
  bool showCounter = true,

  // 높이 관련
  double? fixedHeight,
  double? minHeight,
  double? maxHeight,
  bool expandable = false,

  // 기타
  TextInputType? keyboardType,
  TextInputAction? textInputAction,
  bool enabled = true,
  bool clearable = true,
  Widget? prefix,
  Widget? suffix,

  // 상태 관련
  bool showSuccessIcon = false,
  ValueChanged<TextFieldState>? onStateChanged,
})
```

**사용 예시:**

1. **단문 TextField (외부 카운터)**

```dart
AppEnhancedTextField(
  label: '이름',
  controller: controller,
  hintText: '이름을 입력해주세요',
  maxLength: 20,
  required: true,
  textFieldType: TextFieldType.shortText,
  counterPosition: CounterPosition.outside,
)
```

2. **장문 TextField (내부 카운터)**

```dart
AppEnhancedTextField(
  label: '설명',
  controller: controller,
  hintText: '상세한 설명을 입력해주세요',
  maxLength: 200,
  textFieldType: TextFieldType.longText,
  counterPosition: CounterPosition.inside,
  minHeight: 120,
)
```

3. **상태 추적**

```dart
AppEnhancedTextField(
  label: '상태 추적',
  controller: controller,
  onStateChanged: (state) {
    print('현재 상태: $state');
    // 상태에 따른 추가 로직
  },
)
```

**상태 열거형:**

```dart
enum TextFieldState {
  normal,       // 기본
  focused,      // 포커싱
  typing,       // 작성중
  completed,    // 작성완료
  disabled,     // 비활성
  error,        // 에러
}
```

**타입 열거형:**

```dart
enum TextFieldType {
  shortText,    // 단문 (고정 높이)
  longText,     // 장문 (확장 가능)
}
```

**Counter 위치 열거형:**

```dart
enum CounterPosition {
  inside,        // TextField 내부
  outside,       // TextField 외부
  none,          // 카운터 없음
}
```

### AppPasswordField

비밀번호 입력을 위한 특화된 TextField 컴포넌트입니다.

**주요 기능:**

- 비밀번호 표시/숨김 토글
- 보안 강도 표시
- 비밀번호 정책 검증

### AppSearchField

검색 기능을 위한 특화된 TextField 컴포넌트입니다.

**주요 기능:**

- 검색 아이콘
- 검색어 자동완성
- 검색 히스토리

## 🔘 Button Components

### AppButton

기본 버튼 컴포넌트로, 다양한 스타일과 크기를 지원합니다.

**주요 기능:**

- Primary/Secondary/Ghost 스타일
- Small/Medium/Large 크기
- Loading 상태
- Disabled 상태

### AppButtonGroup

여러 버튼을 그룹화하여 사용할 수 있는 컴포넌트입니다.

**주요 기능:**

- Horizontal/Vertical 정렬
- Equal width 옵션
- Spacing 조절

### AppIconButton

아이콘만 있는 버튼 컴포넌트입니다.

**주요 기능:**

- 다양한 크기
- Circular/Square 모양
- Hover/Active 상태

## 🎨 Design Tokens

모든 컴포넌트는 `lib/design_system/tokens/` 디렉토리의 디자인 토큰을 사용합니다:

- **AppInputTheme**: 입력 필드 관련 토큰
- **AppButtonTheme**: 버튼 관련 토큰
- **AppSpacing**: 간격 관련 상수
- **AppColors**: 색상 팔레트
- **AppTypography**: 타이포그래피 스타일

## 📱 사용 가이드

1. **기본 사용**: `AppTextField` 사용
2. **고급 기능 필요**: `AppEnhancedTextField` 사용
3. **특화된 용도**: `AppPasswordField`, `AppSearchField` 사용
4. **커스터마이징**: 디자인 토큰 수정 또는 새로운 컴포넌트 생성

## 🔄 마이그레이션

기존 `ChecknoteNameField`와 같은 커스텀 TextField를 사용하고 있다면, `AppEnhancedTextField`로 교체하는 것을 권장합니다:

```dart
// 기존
class ChecknoteNameField extends StatelessWidget {
  // ... 복잡한 구현
}

// 새로운 방식
AppEnhancedTextField(
  label: '이름',
  controller: controller,
  required: true,
  // ... 필요한 옵션들
)
```

## 🧪 테스트

`lib/features/demo/enhanced_text_field_demo.dart`에서 모든 기능을 테스트할 수 있습니다.
