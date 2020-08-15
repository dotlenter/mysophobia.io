part of 'location_cubit.dart';

@freezed
abstract class LocationState with _$LocationState {
  const factory LocationState.initial() = Initial;
  const factory LocationState.loading() = Loading;
  const factory LocationState.error(String message) = Error;
  const factory LocationState.permissionDenied(String message) = PermissionDenied;
  const factory LocationState.loaded(Position position) = Loaded;
  const factory LocationState.loadLocation(Position position) = LoadLocation;
}