part of 'navigation_bloc.dart';

@freezed
class NavigationState with _$NavigationState {
  const factory NavigationState.choice() = _Choice;

  const factory NavigationState.dateOfBirth() = _DateOfBirth;

  const factory NavigationState.summary() = _Summary;
}
