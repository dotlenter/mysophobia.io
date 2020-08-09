part of 'diseasesh_cubit.dart';

@freezed
abstract class DiseaseshState with _$DiseaseshState {
  const factory DiseaseshState({
    @required Option<Either<Failure, GlobalTotals>> globalTotalsOrFailure,
    @required bool isFetchingGlobalTotals,
  }) = _DiseaseshState;

  factory DiseaseshState.initial() => DiseaseshState(
        globalTotalsOrFailure: none(),
        isFetchingGlobalTotals: false,
      );
}
