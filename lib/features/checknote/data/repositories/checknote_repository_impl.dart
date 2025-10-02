import 'package:uuid/uuid.dart';
import '../../domain/entities/checknote_entity.dart';
import '../../domain/repositories/checknote_repository.dart';
import '../data_sources/checknote_local_data_source.dart';

/// 체크 노트 리포지토리 구현체
class ChecknoteRepositoryImpl implements ChecknoteRepository {
  const ChecknoteRepositoryImpl(this._localDataSource);

  final ChecknoteLocalDataSource _localDataSource;
  final _uuid = const Uuid();

  @override
  Future<ChecknoteEntity> createChecknote({
    required String name,
    required List<String> imageUrls,
    required ChecknoteType type,
  }) async {
    final now = DateTime.now();
    final checknote = ChecknoteEntity(
      id: _uuid.v4(),
      name: name,
      imageUrls: imageUrls,
      type: type,
      createdAt: now,
      updatedAt: now,
    );

    await _localDataSource.saveChecknote(checknote);
    return checknote;
  }

  @override
  Future<List<ChecknoteEntity>> getChecknotes() async {
    return await _localDataSource.getChecknotes();
  }

  @override
  Future<ChecknoteEntity?> getChecknote(String id) async {
    return await _localDataSource.getChecknote(id);
  }

  @override
  Future<ChecknoteEntity> updateChecknote(ChecknoteEntity checknote) async {
    final updatedChecknote = checknote.copyWith(updatedAt: DateTime.now());
    await _localDataSource.saveChecknote(updatedChecknote);
    return updatedChecknote;
  }

  @override
  Future<void> deleteChecknote(String id) async {
    await _localDataSource.deleteChecknote(id);
  }
}
