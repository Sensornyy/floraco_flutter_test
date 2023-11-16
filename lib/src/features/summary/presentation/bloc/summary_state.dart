part of 'summary_bloc.dart';

@freezed
class SummaryState with _$SummaryState {
  const factory SummaryState.initial() = _Initial;

  const factory SummaryState.failure() = _Failure;

  const factory SummaryState.successSet() = _SuccessSet;

  const factory SummaryState.successGet(String choice, String dateOfBirth) =
      _SuccessGet;
}
