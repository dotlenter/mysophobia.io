part of 'risk_area_cubit.dart';

@freezed
abstract class RiskAreaState with _$RiskAreaState{
  const factory RiskAreaState.initial() = Initial;
  const factory RiskAreaState.loading() = Loading;
  const factory RiskAreaState.loaded(List<RiskArea> riskAreas) = Loaded;
  const factory RiskAreaState.error(String message) = Error;
}