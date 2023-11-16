import 'package:dartz/dartz.dart';

import 'package:floraco_flutter_test/core/failures/failure.dart';

abstract class SummaryRepository {
  Future<Either<Failure, void>> setChoice(String choice);

  Future<Either<Failure, void>> setDateOfBirth(String dateOfBirth);

  Future<Either<Failure, String?>> getChoice();

  Future<Either<Failure, String?>> getDateOfBirth();
}
