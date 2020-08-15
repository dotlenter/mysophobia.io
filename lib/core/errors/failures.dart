import 'package:freezed_annotation/freezed_annotation.dart';
part 'failures.freezed.dart';

@freezed
abstract class Failure with _$Failure {
  const factory Failure.serverError() = ServerError;
  const factory Failure.socketError() = SocketError;
  const factory Failure.notFoundError() = NotFoundError;
  const factory Failure.networkError() = NetworkError;
  const factory Failure.cachingError() = CachingError;
  const factory Failure.forbiddenAccessToURLError() = ForbiddenAccessToURLError;
  const factory Failure.emptyError() = EmptyError;
  const factory Failure.locationError() = LocationError;
  const factory Failure.invalid() = Invalid;
  const factory Failure.permissionDeniedError() = PermissionDeniedError;
  const factory Failure.disabledLocationServiceError() =
      DisabledLocationService;
}
