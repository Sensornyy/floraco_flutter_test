import 'package:dartz/dartz.dart';

import 'package:floraco_flutter_test/core/failures/failure.dart';
import 'package:floraco_flutter_test/core/use_case/use_case.dart';
import 'package:floraco_flutter_test/src/features/summary/domain/repository/summary_repository.dart';

class SetChoiceUseCase extends UseCase<void, SingleStringParams> {
  final SummaryRepository repository;

  SetChoiceUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(SingleStringParams params) async {
    return await repository.setChoice(params.value);
  }
}
