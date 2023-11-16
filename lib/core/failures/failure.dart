import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class StorageFailure extends Failure {
  @override
  List<Object?> get props => [];
}
