import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/data_sources/checknote_local_data_source.dart';
import '../../data/repositories/checknote_repository_impl.dart';
import '../../domain/repositories/checknote_repository.dart';
import '../../domain/use_cases/create_checknote_use_case.dart';
import '../../domain/entities/checknote_entity.dart';

/// 데이터 소스 프로바이더
final checknoteDataSourceProvider = Provider<ChecknoteLocalDataSource>(
  (ref) => const ChecknoteLocalDataSource(),
);

/// 리포지토리 프로바이더
final checknoteRepositoryProvider = Provider<ChecknoteRepository>(
  (ref) => ChecknoteRepositoryImpl(
    ref.watch(checknoteDataSourceProvider),
  ),
);

/// 유스케이스 프로바이더
final createChecknoteUseCaseProvider = Provider<CreateChecknoteUseCase>(
  (ref) => CreateChecknoteUseCase(
    ref.watch(checknoteRepositoryProvider),
  ),
);

/// 체크 노트 생성 상태 프로바이더
final createChecknoteProvider =
    StateNotifierProvider<CreateChecknoteNotifier, AsyncValue<void>>(
  (ref) => CreateChecknoteNotifier(
    ref.watch(createChecknoteUseCaseProvider),
  ),
);

/// 체크 노트 생성 상태 관리
class CreateChecknoteNotifier extends StateNotifier<AsyncValue<void>> {
  CreateChecknoteNotifier(this._useCase) : super(const AsyncValue.data(null));

  final CreateChecknoteUseCase _useCase;

  /// 체크 노트를 생성합니다.
  Future<void> createChecknote({
    required String name,
    required List<String> imageUrls,
    required ChecknoteType type,
  }) async {
    state = const AsyncValue.loading();

    try {
      await _useCase(name: name, imageUrls: imageUrls, type: type);
      state = const AsyncValue.data(null);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
}
