import '../entities/checknote_entity.dart';

/// 체크 노트 리포지토리 인터페이스
abstract class ChecknoteRepository {
  /// 체크 노트를 생성합니다.
  Future<ChecknoteEntity> createChecknote({
    required String name,
    required List<String> imageUrls,
    required ChecknoteType type,
  });

  /// 체크 노트 목록을 조회합니다.
  Future<List<ChecknoteEntity>> getChecknotes();

  /// 체크 노트를 조회합니다.
  Future<ChecknoteEntity?> getChecknote(String id);

  /// 체크 노트를 수정합니다.
  Future<ChecknoteEntity> updateChecknote(ChecknoteEntity checknote);

  /// 체크 노트를 삭제합니다.
  Future<void> deleteChecknote(String id);
}
