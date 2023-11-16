import 'package:dartz/dartz.dart';

import 'package:floraco_flutter_test/core/failures/failure.dart';
import 'package:floraco_flutter_test/core/use_case/use_case.dart';
import 'package:floraco_flutter_test/src/features/summary/domain/repository/summary_repository.dart';

class GetChoiceUseCase extends UseCase<void, NoParams> {
  final SummaryRepository repository;

  GetChoiceUseCase(this.repository);

  @override
  Future<Either<Failure, String?>> call(NoParams params) async {
    return await repository.getChoice();
  }
}
