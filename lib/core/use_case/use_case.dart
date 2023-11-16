import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:floraco_flutter_test/core/failures/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

class SingleStringParams extends Equatable {
  final String value;

  const SingleStringParams(this.value);

  @override
  List<Object?> get props => [value];
}
