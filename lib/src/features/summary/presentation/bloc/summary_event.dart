part of 'summary_bloc.dart';

@freezed
class SummaryEvent with _$SummaryEvent {
  const factory SummaryEvent.setChoice(String choice) = _SetChoice;

  const factory SummaryEvent.setDateOfBirth(String dateOfBirth) =
      _SetDateOfBirth;

  const factory SummaryEvent.get() = _Get;
}
