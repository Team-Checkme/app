import '../entities/checknote_entity.dart';
import '../repositories/checknote_repository.dart';

/// 체크 노트 생성 유스케이스
class CreateChecknoteUseCase {
  const CreateChecknoteUseCase(this._repository);

  final ChecknoteRepository _repository;

  /// 체크 노트를 생성합니다.
  Future<ChecknoteEntity> call({
    required String name,
    required List<String> imageUrls,
    required ChecknoteType type,
  }) async {
    // 비즈니스 로직 검증
    if (name.trim().isEmpty) {
      throw ArgumentError('체크 노트 이름은 필수입니다.');
    }

    if (name.length < 5) {
      throw ArgumentError('체크 노트 이름은 최소 5자 이상이어야 합니다.');
    }

    if (name.length > 50) {
      throw ArgumentError('체크 노트 이름은 50자를 초과할 수 없습니다.');
    }

    if (imageUrls.length > 10) {
      throw ArgumentError('대표 이미지는 최대 10장까지 추가 가능합니다.');
    }

    return await _repository.createChecknote(
      name: name.trim(),
      imageUrls: imageUrls,
      type: type,
    );
  }
}
