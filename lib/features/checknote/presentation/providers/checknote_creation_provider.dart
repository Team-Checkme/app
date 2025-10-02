import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/checknote_entity.dart';

/// 체크노트 생성 과정의 데이터를 관리하는 상태
class ChecknoteCreationState {
  final int currentStep;
  final String? name;
  final List<String> imageUrls;
  final ChecknoteType? type;
  final String? description;
  final List<String> keywords;
  final int? maxParticipants;
  final bool isUnlimitedParticipants;
  final List<String> checkItems;

  const ChecknoteCreationState({
    this.currentStep = 0,
    this.name,
    this.imageUrls = const [],
    this.type,
    this.description,
    this.keywords = const [],
    this.maxParticipants,
    this.isUnlimitedParticipants = true,
    this.checkItems = const [],
  });

  ChecknoteCreationState copyWith({
    int? currentStep,
    String? name,
    List<String>? imageUrls,
    ChecknoteType? type,
    String? description,
    List<String>? keywords,
    int? maxParticipants,
    bool? isUnlimitedParticipants,
    List<String>? checkItems,
  }) {
    return ChecknoteCreationState(
      currentStep: currentStep ?? this.currentStep,
      name: name ?? this.name,
      imageUrls: imageUrls ?? this.imageUrls,
      type: type ?? this.type,
      description: description ?? this.description,
      keywords: keywords ?? this.keywords,
      maxParticipants: maxParticipants ?? this.maxParticipants,
      isUnlimitedParticipants:
          isUnlimitedParticipants ?? this.isUnlimitedParticipants,
      checkItems: checkItems ?? this.checkItems,
    );
  }

  /// step1 데이터가 완성되었는지 확인
  bool get isStep1Complete {
    return name != null && name!.isNotEmpty && type != null;
  }

  /// step2 데이터가 완성되었는지 확인
  bool get isStep2Complete {
    return description != null && description!.isNotEmpty;
  }

  /// step3 데이터가 완성되었는지 확인
  bool get isStep3Complete {
    return checkItems.isNotEmpty;
  }

  /// 모든 필수 데이터가 완성되었는지 확인
  bool get isAllStepsComplete {
    return isStep1Complete && isStep2Complete && isStep3Complete;
  }
}

/// 체크노트 생성 과정을 관리하는 Notifier
class ChecknoteCreationNotifier extends StateNotifier<ChecknoteCreationState> {
  ChecknoteCreationNotifier() : super(const ChecknoteCreationState());

  /// 다음 step으로 이동
  void nextStep() {
    if (state.currentStep < 2) {
      state = state.copyWith(currentStep: state.currentStep + 1);
    }
  }

  /// 이전 step으로 이동
  void previousStep() {
    if (state.currentStep > 0) {
      state = state.copyWith(currentStep: state.currentStep - 1);
    }
  }

  /// 특정 step으로 이동
  void goToStep(int step) {
    if (step >= 0 && step <= 2) {
      state = state.copyWith(currentStep: step);
    }
  }

  /// step1 데이터 업데이트
  void updateStep1Data({
    String? name,
    List<String>? imageUrls,
    ChecknoteType? type,
  }) {
    state = state.copyWith(
      name: name,
      imageUrls: imageUrls,
      type: type,
    );
  }

  /// step2 데이터 업데이트
  void updateStep2Data({
    String? description,
    List<String>? keywords,
    int? maxParticipants,
    bool? isUnlimitedParticipants,
  }) {
    state = state.copyWith(
      description: description,
      keywords: keywords,
      maxParticipants: maxParticipants,
      isUnlimitedParticipants: isUnlimitedParticipants,
    );
  }

  /// step3 데이터 업데이트
  void updateStep3Data({
    List<String>? checkItems,
  }) {
    state = state.copyWith(
      checkItems: checkItems,
    );
  }

  /// 키워드 추가
  void addKeyword(String keyword) {
    if (keyword.isNotEmpty &&
        !state.keywords.contains(keyword) &&
        state.keywords.length < 10) {
      final newKeywords = List<String>.from(state.keywords)..add(keyword);
      state = state.copyWith(keywords: newKeywords);
    }
  }

  /// 키워드 제거
  void removeKeyword(String keyword) {
    final newKeywords = List<String>.from(state.keywords)..remove(keyword);
    state = state.copyWith(keywords: newKeywords);
  }

  /// 이미지 추가
  void addImage(String imageUrl) {
    if (state.imageUrls.length < 10) {
      final newImageUrls = List<String>.from(state.imageUrls)..add(imageUrl);
      state = state.copyWith(imageUrls: newImageUrls);
    }
  }

  /// 이미지 제거
  void removeImage(int index) {
    if (index >= 0 && index < state.imageUrls.length) {
      final newImageUrls = List<String>.from(state.imageUrls)..removeAt(index);
      state = state.copyWith(imageUrls: newImageUrls);
    }
  }

  /// 체크리스트 아이템 추가 (자동으로 색상 적용)
  void addCheckItem(String title, {String description = ''}) {
    final newCheckItems = List<String>.from(state.checkItems)..add(title);
    state = state.copyWith(checkItems: newCheckItems);
  }

  /// 체크리스트 아이템 제거
  void removeCheckItem(int index) {
    if (index >= 0 && index < state.checkItems.length) {
      final newCheckItems = List<String>.from(state.checkItems)
        ..removeAt(index);
      state = state.copyWith(checkItems: newCheckItems);
    }
  }

  /// 상태 초기화
  void reset() {
    state = const ChecknoteCreationState();
  }
}

/// 체크노트 생성 과정 관리 provider
final checknoteCreationProvider =
    StateNotifierProvider<ChecknoteCreationNotifier, ChecknoteCreationState>(
  (ref) => ChecknoteCreationNotifier(),
);
