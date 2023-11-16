part of 'navigation_bloc.dart';

@freezed
class NavigationEvent with _$NavigationEvent {
  const factory NavigationEvent.goToChoicePage() = _GoToChoicePage;

  const factory NavigationEvent.goToDateOfBirthPage() = _GoToDateOfBirthPage;

  const factory NavigationEvent.goToSummaryPage() = _GoToSummaryPage;
}
