// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$FailureTearOff {
  const _$FailureTearOff();

// ignore: unused_element
  ServerError serverError() {
    return const ServerError();
  }

// ignore: unused_element
  SocketError socketError() {
    return const SocketError();
  }

// ignore: unused_element
  NotFoundError notFoundError() {
    return const NotFoundError();
  }

// ignore: unused_element
  NetworkError networkError() {
    return const NetworkError();
  }

// ignore: unused_element
  CachingError cachingError() {
    return const CachingError();
  }

// ignore: unused_element
  ForbiddenAccessToURLError forbiddenAccessToURLError() {
    return const ForbiddenAccessToURLError();
  }
}

// ignore: unused_element
const $Failure = _$FailureTearOff();

mixin _$Failure {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result serverError(),
    @required Result socketError(),
    @required Result notFoundError(),
    @required Result networkError(),
    @required Result cachingError(),
    @required Result forbiddenAccessToURLError(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result serverError(),
    Result socketError(),
    Result notFoundError(),
    Result networkError(),
    Result cachingError(),
    Result forbiddenAccessToURLError(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result serverError(ServerError value),
    @required Result socketError(SocketError value),
    @required Result notFoundError(NotFoundError value),
    @required Result networkError(NetworkError value),
    @required Result cachingError(CachingError value),
    @required Result forbiddenAccessToURLError(ForbiddenAccessToURLError value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result serverError(ServerError value),
    Result socketError(SocketError value),
    Result notFoundError(NotFoundError value),
    Result networkError(NetworkError value),
    Result cachingError(CachingError value),
    Result forbiddenAccessToURLError(ForbiddenAccessToURLError value),
    @required Result orElse(),
  });
}

abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res>;
}

class _$FailureCopyWithImpl<$Res> implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  final Failure _value;
  // ignore: unused_field
  final $Res Function(Failure) _then;
}

abstract class $ServerErrorCopyWith<$Res> {
  factory $ServerErrorCopyWith(
          ServerError value, $Res Function(ServerError) then) =
      _$ServerErrorCopyWithImpl<$Res>;
}

class _$ServerErrorCopyWithImpl<$Res> extends _$FailureCopyWithImpl<$Res>
    implements $ServerErrorCopyWith<$Res> {
  _$ServerErrorCopyWithImpl(
      ServerError _value, $Res Function(ServerError) _then)
      : super(_value, (v) => _then(v as ServerError));

  @override
  ServerError get _value => super._value as ServerError;
}

class _$ServerError implements ServerError {
  const _$ServerError();

  @override
  String toString() {
    return 'Failure.serverError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ServerError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result serverError(),
    @required Result socketError(),
    @required Result notFoundError(),
    @required Result networkError(),
    @required Result cachingError(),
    @required Result forbiddenAccessToURLError(),
  }) {
    assert(serverError != null);
    assert(socketError != null);
    assert(notFoundError != null);
    assert(networkError != null);
    assert(cachingError != null);
    assert(forbiddenAccessToURLError != null);
    return serverError();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result serverError(),
    Result socketError(),
    Result notFoundError(),
    Result networkError(),
    Result cachingError(),
    Result forbiddenAccessToURLError(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (serverError != null) {
      return serverError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result serverError(ServerError value),
    @required Result socketError(SocketError value),
    @required Result notFoundError(NotFoundError value),
    @required Result networkError(NetworkError value),
    @required Result cachingError(CachingError value),
    @required Result forbiddenAccessToURLError(ForbiddenAccessToURLError value),
  }) {
    assert(serverError != null);
    assert(socketError != null);
    assert(notFoundError != null);
    assert(networkError != null);
    assert(cachingError != null);
    assert(forbiddenAccessToURLError != null);
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result serverError(ServerError value),
    Result socketError(SocketError value),
    Result notFoundError(NotFoundError value),
    Result networkError(NetworkError value),
    Result cachingError(CachingError value),
    Result forbiddenAccessToURLError(ForbiddenAccessToURLError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class ServerError implements Failure {
  const factory ServerError() = _$ServerError;
}

abstract class $SocketErrorCopyWith<$Res> {
  factory $SocketErrorCopyWith(
          SocketError value, $Res Function(SocketError) then) =
      _$SocketErrorCopyWithImpl<$Res>;
}

class _$SocketErrorCopyWithImpl<$Res> extends _$FailureCopyWithImpl<$Res>
    implements $SocketErrorCopyWith<$Res> {
  _$SocketErrorCopyWithImpl(
      SocketError _value, $Res Function(SocketError) _then)
      : super(_value, (v) => _then(v as SocketError));

  @override
  SocketError get _value => super._value as SocketError;
}

class _$SocketError implements SocketError {
  const _$SocketError();

  @override
  String toString() {
    return 'Failure.socketError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SocketError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result serverError(),
    @required Result socketError(),
    @required Result notFoundError(),
    @required Result networkError(),
    @required Result cachingError(),
    @required Result forbiddenAccessToURLError(),
  }) {
    assert(serverError != null);
    assert(socketError != null);
    assert(notFoundError != null);
    assert(networkError != null);
    assert(cachingError != null);
    assert(forbiddenAccessToURLError != null);
    return socketError();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result serverError(),
    Result socketError(),
    Result notFoundError(),
    Result networkError(),
    Result cachingError(),
    Result forbiddenAccessToURLError(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (socketError != null) {
      return socketError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result serverError(ServerError value),
    @required Result socketError(SocketError value),
    @required Result notFoundError(NotFoundError value),
    @required Result networkError(NetworkError value),
    @required Result cachingError(CachingError value),
    @required Result forbiddenAccessToURLError(ForbiddenAccessToURLError value),
  }) {
    assert(serverError != null);
    assert(socketError != null);
    assert(notFoundError != null);
    assert(networkError != null);
    assert(cachingError != null);
    assert(forbiddenAccessToURLError != null);
    return socketError(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result serverError(ServerError value),
    Result socketError(SocketError value),
    Result notFoundError(NotFoundError value),
    Result networkError(NetworkError value),
    Result cachingError(CachingError value),
    Result forbiddenAccessToURLError(ForbiddenAccessToURLError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (socketError != null) {
      return socketError(this);
    }
    return orElse();
  }
}

abstract class SocketError implements Failure {
  const factory SocketError() = _$SocketError;
}

abstract class $NotFoundErrorCopyWith<$Res> {
  factory $NotFoundErrorCopyWith(
          NotFoundError value, $Res Function(NotFoundError) then) =
      _$NotFoundErrorCopyWithImpl<$Res>;
}

class _$NotFoundErrorCopyWithImpl<$Res> extends _$FailureCopyWithImpl<$Res>
    implements $NotFoundErrorCopyWith<$Res> {
  _$NotFoundErrorCopyWithImpl(
      NotFoundError _value, $Res Function(NotFoundError) _then)
      : super(_value, (v) => _then(v as NotFoundError));

  @override
  NotFoundError get _value => super._value as NotFoundError;
}

class _$NotFoundError implements NotFoundError {
  const _$NotFoundError();

  @override
  String toString() {
    return 'Failure.notFoundError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is NotFoundError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result serverError(),
    @required Result socketError(),
    @required Result notFoundError(),
    @required Result networkError(),
    @required Result cachingError(),
    @required Result forbiddenAccessToURLError(),
  }) {
    assert(serverError != null);
    assert(socketError != null);
    assert(notFoundError != null);
    assert(networkError != null);
    assert(cachingError != null);
    assert(forbiddenAccessToURLError != null);
    return notFoundError();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result serverError(),
    Result socketError(),
    Result notFoundError(),
    Result networkError(),
    Result cachingError(),
    Result forbiddenAccessToURLError(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (notFoundError != null) {
      return notFoundError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result serverError(ServerError value),
    @required Result socketError(SocketError value),
    @required Result notFoundError(NotFoundError value),
    @required Result networkError(NetworkError value),
    @required Result cachingError(CachingError value),
    @required Result forbiddenAccessToURLError(ForbiddenAccessToURLError value),
  }) {
    assert(serverError != null);
    assert(socketError != null);
    assert(notFoundError != null);
    assert(networkError != null);
    assert(cachingError != null);
    assert(forbiddenAccessToURLError != null);
    return notFoundError(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result serverError(ServerError value),
    Result socketError(SocketError value),
    Result notFoundError(NotFoundError value),
    Result networkError(NetworkError value),
    Result cachingError(CachingError value),
    Result forbiddenAccessToURLError(ForbiddenAccessToURLError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (notFoundError != null) {
      return notFoundError(this);
    }
    return orElse();
  }
}

abstract class NotFoundError implements Failure {
  const factory NotFoundError() = _$NotFoundError;
}

abstract class $NetworkErrorCopyWith<$Res> {
  factory $NetworkErrorCopyWith(
          NetworkError value, $Res Function(NetworkError) then) =
      _$NetworkErrorCopyWithImpl<$Res>;
}

class _$NetworkErrorCopyWithImpl<$Res> extends _$FailureCopyWithImpl<$Res>
    implements $NetworkErrorCopyWith<$Res> {
  _$NetworkErrorCopyWithImpl(
      NetworkError _value, $Res Function(NetworkError) _then)
      : super(_value, (v) => _then(v as NetworkError));

  @override
  NetworkError get _value => super._value as NetworkError;
}

class _$NetworkError implements NetworkError {
  const _$NetworkError();

  @override
  String toString() {
    return 'Failure.networkError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is NetworkError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result serverError(),
    @required Result socketError(),
    @required Result notFoundError(),
    @required Result networkError(),
    @required Result cachingError(),
    @required Result forbiddenAccessToURLError(),
  }) {
    assert(serverError != null);
    assert(socketError != null);
    assert(notFoundError != null);
    assert(networkError != null);
    assert(cachingError != null);
    assert(forbiddenAccessToURLError != null);
    return networkError();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result serverError(),
    Result socketError(),
    Result notFoundError(),
    Result networkError(),
    Result cachingError(),
    Result forbiddenAccessToURLError(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (networkError != null) {
      return networkError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result serverError(ServerError value),
    @required Result socketError(SocketError value),
    @required Result notFoundError(NotFoundError value),
    @required Result networkError(NetworkError value),
    @required Result cachingError(CachingError value),
    @required Result forbiddenAccessToURLError(ForbiddenAccessToURLError value),
  }) {
    assert(serverError != null);
    assert(socketError != null);
    assert(notFoundError != null);
    assert(networkError != null);
    assert(cachingError != null);
    assert(forbiddenAccessToURLError != null);
    return networkError(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result serverError(ServerError value),
    Result socketError(SocketError value),
    Result notFoundError(NotFoundError value),
    Result networkError(NetworkError value),
    Result cachingError(CachingError value),
    Result forbiddenAccessToURLError(ForbiddenAccessToURLError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (networkError != null) {
      return networkError(this);
    }
    return orElse();
  }
}

abstract class NetworkError implements Failure {
  const factory NetworkError() = _$NetworkError;
}

abstract class $CachingErrorCopyWith<$Res> {
  factory $CachingErrorCopyWith(
          CachingError value, $Res Function(CachingError) then) =
      _$CachingErrorCopyWithImpl<$Res>;
}

class _$CachingErrorCopyWithImpl<$Res> extends _$FailureCopyWithImpl<$Res>
    implements $CachingErrorCopyWith<$Res> {
  _$CachingErrorCopyWithImpl(
      CachingError _value, $Res Function(CachingError) _then)
      : super(_value, (v) => _then(v as CachingError));

  @override
  CachingError get _value => super._value as CachingError;
}

class _$CachingError implements CachingError {
  const _$CachingError();

  @override
  String toString() {
    return 'Failure.cachingError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is CachingError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result serverError(),
    @required Result socketError(),
    @required Result notFoundError(),
    @required Result networkError(),
    @required Result cachingError(),
    @required Result forbiddenAccessToURLError(),
  }) {
    assert(serverError != null);
    assert(socketError != null);
    assert(notFoundError != null);
    assert(networkError != null);
    assert(cachingError != null);
    assert(forbiddenAccessToURLError != null);
    return cachingError();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result serverError(),
    Result socketError(),
    Result notFoundError(),
    Result networkError(),
    Result cachingError(),
    Result forbiddenAccessToURLError(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (cachingError != null) {
      return cachingError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result serverError(ServerError value),
    @required Result socketError(SocketError value),
    @required Result notFoundError(NotFoundError value),
    @required Result networkError(NetworkError value),
    @required Result cachingError(CachingError value),
    @required Result forbiddenAccessToURLError(ForbiddenAccessToURLError value),
  }) {
    assert(serverError != null);
    assert(socketError != null);
    assert(notFoundError != null);
    assert(networkError != null);
    assert(cachingError != null);
    assert(forbiddenAccessToURLError != null);
    return cachingError(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result serverError(ServerError value),
    Result socketError(SocketError value),
    Result notFoundError(NotFoundError value),
    Result networkError(NetworkError value),
    Result cachingError(CachingError value),
    Result forbiddenAccessToURLError(ForbiddenAccessToURLError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (cachingError != null) {
      return cachingError(this);
    }
    return orElse();
  }
}

abstract class CachingError implements Failure {
  const factory CachingError() = _$CachingError;
}

abstract class $ForbiddenAccessToURLErrorCopyWith<$Res> {
  factory $ForbiddenAccessToURLErrorCopyWith(ForbiddenAccessToURLError value,
          $Res Function(ForbiddenAccessToURLError) then) =
      _$ForbiddenAccessToURLErrorCopyWithImpl<$Res>;
}

class _$ForbiddenAccessToURLErrorCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res>
    implements $ForbiddenAccessToURLErrorCopyWith<$Res> {
  _$ForbiddenAccessToURLErrorCopyWithImpl(ForbiddenAccessToURLError _value,
      $Res Function(ForbiddenAccessToURLError) _then)
      : super(_value, (v) => _then(v as ForbiddenAccessToURLError));

  @override
  ForbiddenAccessToURLError get _value =>
      super._value as ForbiddenAccessToURLError;
}

class _$ForbiddenAccessToURLError implements ForbiddenAccessToURLError {
  const _$ForbiddenAccessToURLError();

  @override
  String toString() {
    return 'Failure.forbiddenAccessToURLError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ForbiddenAccessToURLError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result serverError(),
    @required Result socketError(),
    @required Result notFoundError(),
    @required Result networkError(),
    @required Result cachingError(),
    @required Result forbiddenAccessToURLError(),
  }) {
    assert(serverError != null);
    assert(socketError != null);
    assert(notFoundError != null);
    assert(networkError != null);
    assert(cachingError != null);
    assert(forbiddenAccessToURLError != null);
    return forbiddenAccessToURLError();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result serverError(),
    Result socketError(),
    Result notFoundError(),
    Result networkError(),
    Result cachingError(),
    Result forbiddenAccessToURLError(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (forbiddenAccessToURLError != null) {
      return forbiddenAccessToURLError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result serverError(ServerError value),
    @required Result socketError(SocketError value),
    @required Result notFoundError(NotFoundError value),
    @required Result networkError(NetworkError value),
    @required Result cachingError(CachingError value),
    @required Result forbiddenAccessToURLError(ForbiddenAccessToURLError value),
  }) {
    assert(serverError != null);
    assert(socketError != null);
    assert(notFoundError != null);
    assert(networkError != null);
    assert(cachingError != null);
    assert(forbiddenAccessToURLError != null);
    return forbiddenAccessToURLError(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result serverError(ServerError value),
    Result socketError(SocketError value),
    Result notFoundError(NotFoundError value),
    Result networkError(NetworkError value),
    Result cachingError(CachingError value),
    Result forbiddenAccessToURLError(ForbiddenAccessToURLError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (forbiddenAccessToURLError != null) {
      return forbiddenAccessToURLError(this);
    }
    return orElse();
  }
}

abstract class ForbiddenAccessToURLError implements Failure {
  const factory ForbiddenAccessToURLError() = _$ForbiddenAccessToURLError;
}
