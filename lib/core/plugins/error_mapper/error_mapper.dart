library error_mapper;

import 'package:mysophobia_io/core/errors/failures.dart';

class ErrorMapper {
  final Failure failure;
  ErrorMapper(this.failure);

  String mapErrorToHumanReadableMsg() {
    return failure.map(
      serverError: (_) =>
          'Something went wrong with the server, please try again later.',
      socketError: (_) =>
          'Something went wrong with the server, please try again later.',
      notFoundError: (_) => 'File not found.',
      networkError: (_) =>
          'Network Error, please check your internet connection and try again.',
      cachingError: (_) => 'Caching Error, something went wrong with caching.',
      forbiddenAccessToURLError: (_) => 'Forbidden Access',
      emptyError: (_) =>
          // ignore: missing_return
          'Something went wrong with the server, please try again later.',
      disabledLocationServiceError: (_) =>
          'Cannot get specific device position, location service is disabled.',
      permissionDeniedError: (_) =>
          'Cannot continue with the process, permission is denied.',
      invalid: (_) => 'Invalid process.',
      locationError: (_) => 'Could not get location.',
    );
  }

  String convertToErrorCode() {
    return failure.map(
      serverError: (_) => '0x000',
      socketError: (_) => '0x123',
      notFoundError: (_) => '0x124',
      networkError: (_) => '0x125',
      cachingError: (_) => '0x126',
      forbiddenAccessToURLError: (_) => '0x127',
      emptyError: (_) => '0x128',
      permissionDeniedError: (_) => '0x129',
      disabledLocationServiceError: (_) => '0x130',
      invalid: (_) => '0x122',
      locationError: (_) => '0x121',
    );
  }

  bool isErrorPermissionDenied() => ('0x129' == convertToErrorCode());
  bool isErrorServerError() => ('0x000' == convertToErrorCode());
  bool isErrorDisabledLocationService() => ('0x130' == convertToErrorCode());
}
