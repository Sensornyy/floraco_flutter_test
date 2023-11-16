import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:floraco_flutter_test/dependencies.dart' as di;
import 'package:floraco_flutter_test/src/features/summary/domain/use_cases/get_choice_use_case.dart';
import 'package:floraco_flutter_test/src/features/summary/domain/use_cases/get_date_of_birth_use_case.dart';
import 'package:floraco_flutter_test/src/features/summary/domain/use_cases/set_choice_use_case.dart';
import 'package:floraco_flutter_test/src/features/summary/domain/use_cases/set_date_of_birth_use_case.dart';
import 'package:floraco_flutter_test/core/use_case/use_case.dart';

part 'summary_event.dart';

part 'summary_state.dart';

part 'summary_bloc.freezed.dart';

class SummaryBloc extends Bloc<SummaryEvent, SummaryState> {
  final SetChoiceUseCase setChoice = di.getIt<SetChoiceUseCase>();
  final GetChoiceUseCase getChoice = di.getIt<GetChoiceUseCase>();
  final SetDateOfBirthUseCase setDateOfBirth =
      di.getIt<SetDateOfBirthUseCase>();
  final GetDateOfBirthUseCase getDateOfBirth =
      di.getIt<GetDateOfBirthUseCase>();

  SummaryBloc() : super(const SummaryState.initial()) {
    on<SummaryEvent>((event, emit) async {
      await event.when(setChoice: (choice) async {
        final result = await setChoice(SingleStringParams(choice));

        result.fold(
          (failure) => emit(const SummaryState.failure()),
          (result) => emit(const SummaryState.successSet()),
        );
      }, setDateOfBirth: (dateOfBirth) async {
        final result = await setDateOfBirth(SingleStringParams(dateOfBirth));

        result.fold(
          (failure) => emit(const SummaryState.failure()),
          (result) => emit(const SummaryState.successSet()),
        );
      }, get: () async {
        emit(const SummaryState.initial());
        final choiceResult = await getChoice(NoParams());
        final dateOfBirthResult = await getDateOfBirth(NoParams());

        choiceResult.fold((failure) => emit(const SummaryState.failure()),
            (choice) {
          dateOfBirthResult.fold(
              (failure) => emit(const SummaryState.failure()), (dateOfBirth) {
            emit(
              SummaryState.successGet(choice!, dateOfBirth!),
            );
          });
        });
      });
    });
  }
}
