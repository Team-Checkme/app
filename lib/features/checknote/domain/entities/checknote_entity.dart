import 'package:freezed_annotation/freezed_annotation.dart';

part 'checknote_entity.freezed.dart';
part 'checknote_entity.g.dart';

/// 체크 노트 도메인 엔티티
@freezed
class ChecknoteEntity with _$ChecknoteEntity {
  const factory ChecknoteEntity({
    required String id,
    required String name,
    required List<String> imageUrls,
    required ChecknoteType type,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ChecknoteEntity;

  factory ChecknoteEntity.fromJson(Map<String, dynamic> json) =>
      _$ChecknoteEntityFromJson(json);
}

/// 체크 노트 유형
enum ChecknoteType {
  single,
  multi,
}
