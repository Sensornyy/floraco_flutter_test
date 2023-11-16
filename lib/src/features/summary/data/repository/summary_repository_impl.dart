import 'package:dartz/dartz.dart';

import 'package:floraco_flutter_test/core/failures/failure.dart';
import 'package:floraco_flutter_test/src/features/summary/data/data_source/summary_data_source.dart';
import 'package:floraco_flutter_test/src/features/summary/domain/repository/summary_repository.dart';

class SummaryRepositoryImpl implements SummaryRepository {
  final SummaryDataSource dataSource;

  SummaryRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, String?>> getChoice() async {
    try {
      return Right(
        await dataSource.getChoice(),
      );
    } catch (e) {
      return Left(
        StorageFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, String?>> getDateOfBirth() async {
    try {
      return Right(
        await dataSource.getDateOfBirth(),
      );
    } catch (e) {
      return Left(
        StorageFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, void>> setChoice(String choice) async {
    try {
      return Right(
        await dataSource.setChoice(choice),
      );
    } catch (e) {
      return Left(
        StorageFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, void>> setDateOfBirth(String dateOfBirth) async {
    try {
      return Right(
        await dataSource.setDateOfBirth(dateOfBirth),
      );
    } catch (e) {
      return Left(
        StorageFailure(),
      );
    }
  }
}
