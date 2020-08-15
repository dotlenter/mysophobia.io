part of 'country_cubit.dart';

@freezed
abstract class CountryState with _$CountryState {
  const factory CountryState.initial() = Initial;
  const factory CountryState.loading() = Loading;
  const factory CountryState.loaded(CountryTotals countryTotal) = Loaded;
  const factory CountryState.permissionDenied(String errorMsg) = PermissionDenied;
  const factory CountryState.error(String error) = Error;
}
