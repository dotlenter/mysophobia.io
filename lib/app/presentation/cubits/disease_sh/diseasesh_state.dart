part of 'diseasesh_cubit.dart';

@freezed
abstract class DiseaseshState with _$DiseaseshState {
  const factory DiseaseshState.initial() = Initial;
  const factory DiseaseshState.loading() = Loading;
  const factory DiseaseshState.loaded(GlobalTotals total) = Loaded;
  const factory DiseaseshState.error(String errorMessage) = Error;
}
