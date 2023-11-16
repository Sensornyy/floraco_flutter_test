import 'package:floraco_flutter_test/src/features/summary/data/data_source/summary_data_source.dart';
import 'package:get_it/get_it.dart';

import 'package:floraco_flutter_test/core/service/storage_service.dart';
import 'package:floraco_flutter_test/src/features/summary/data/repository/summary_repository_impl.dart';
import 'package:floraco_flutter_test/src/features/summary/domain/repository/summary_repository.dart';
import 'package:floraco_flutter_test/src/features/summary/domain/use_cases/get_choice_use_case.dart';
import 'package:floraco_flutter_test/src/features/summary/domain/use_cases/get_date_of_birth_use_case.dart';
import 'package:floraco_flutter_test/src/features/summary/domain/use_cases/set_choice_use_case.dart';
import 'package:floraco_flutter_test/src/features/summary/domain/use_cases/set_date_of_birth_use_case.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final getIt = GetIt.instance;

void init() {
  getIt.registerLazySingleton(
    () => GetChoiceUseCase(
      getIt(),
    ),
  );

  getIt.registerLazySingleton(
    () => GetDateOfBirthUseCase(
      getIt(),
    ),
  );
  getIt.registerLazySingleton(
    () => SetChoiceUseCase(
      getIt(),
    ),
  );
  getIt.registerLazySingleton(
    () => SetDateOfBirthUseCase(
      getIt(),
    ),
  );

  getIt.registerLazySingleton<SummaryRepository>(
    () => SummaryRepositoryImpl(
      getIt(),
    ),
  );

  getIt.registerLazySingleton<SummaryDataSource>(
    () => SummaryDataSourceImpl(
      storageService: getIt(),
    ),
  );

  getIt.registerLazySingleton(
    () => StorageService(
      getIt(),
    ),
  );

  getIt.registerLazySingleton(
    () => const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
    ),
  );
}
