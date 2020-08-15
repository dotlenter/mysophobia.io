part of 'vaccine_cubit.dart';

@freezed
abstract class VaccineState with _$VaccineState {
  const factory VaccineState.initial() = Initial;
  const factory VaccineState.loading() = Loading;
  const factory VaccineState.loaded(Vaccines vaccines) = Loaded;
  const factory VaccineState.error(String message) = Error;
}
