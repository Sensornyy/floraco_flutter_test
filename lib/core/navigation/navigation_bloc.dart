import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'navigation_event.dart';

part 'navigation_state.dart';

part 'navigation_bloc.freezed.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(const NavigationState.choice()) {
    on<NavigationEvent>((event, emit) {
      event.when(goToDateOfBirthPage: () {
        emit(
          const NavigationState.dateOfBirth(),
        );
      }, goToSummaryPage: () {
        emit(
          const NavigationState.summary(),
        );
      }, goToChoicePage: () {
        emit(
          const NavigationState.choice(),
        );
      });
    });
  }
}
