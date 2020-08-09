class AppException implements Exception {
  final String _message;
  final String _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return '$_prefix$_message';
  }
}

class ServerException extends AppException {
  ServerException([String message]) : super(message, 'ServerError: ');
}

class ForbiddenException extends AppException {
  ForbiddenException([String message]) : super(message, 'InvalidAccessError: ');
}

class NotFoundException extends AppException {
  NotFoundException([String message]) : super(message, 'NotFoundError: ');
}

class BadRequestException extends AppException {
  BadRequestException([String message])
      : super(message, 'BadRequestException: ');
}

class CacheException extends AppException {
  CacheException([String message]) : super(message, 'CacheException: ');
}
