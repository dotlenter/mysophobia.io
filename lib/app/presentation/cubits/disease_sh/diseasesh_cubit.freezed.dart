// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'diseasesh_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$DiseaseshStateTearOff {
  const _$DiseaseshStateTearOff();

// ignore: unused_element
  _DiseaseshState call(
      {@required Option<Either<Failure, GlobalTotals>> globalTotalsOrFailure,
      @required bool isFetchingGlobalTotals}) {
    return _DiseaseshState(
      globalTotalsOrFailure: globalTotalsOrFailure,
      isFetchingGlobalTotals: isFetchingGlobalTotals,
    );
  }
}

// ignore: unused_element
const $DiseaseshState = _$DiseaseshStateTearOff();

mixin _$DiseaseshState {
  Option<Either<Failure, GlobalTotals>> get globalTotalsOrFailure;
  bool get isFetchingGlobalTotals;

  $DiseaseshStateCopyWith<DiseaseshState> get copyWith;
}

abstract class $DiseaseshStateCopyWith<$Res> {
  factory $DiseaseshStateCopyWith(
          DiseaseshState value, $Res Function(DiseaseshState) then) =
      _$DiseaseshStateCopyWithImpl<$Res>;
  $Res call(
      {Option<Either<Failure, GlobalTotals>> globalTotalsOrFailure,
      bool isFetchingGlobalTotals});
}

class _$DiseaseshStateCopyWithImpl<$Res>
    implements $DiseaseshStateCopyWith<$Res> {
  _$DiseaseshStateCopyWithImpl(this._value, this._then);

  final DiseaseshState _value;
  // ignore: unused_field
  final $Res Function(DiseaseshState) _then;

  @override
  $Res call({
    Object globalTotalsOrFailure = freezed,
    Object isFetchingGlobalTotals = freezed,
  }) {
    return _then(_value.copyWith(
      globalTotalsOrFailure: globalTotalsOrFailure == freezed
          ? _value.globalTotalsOrFailure
          : globalTotalsOrFailure as Option<Either<Failure, GlobalTotals>>,
      isFetchingGlobalTotals: isFetchingGlobalTotals == freezed
          ? _value.isFetchingGlobalTotals
          : isFetchingGlobalTotals as bool,
    ));
  }
}

abstract class _$DiseaseshStateCopyWith<$Res>
    implements $DiseaseshStateCopyWith<$Res> {
  factory _$DiseaseshStateCopyWith(
          _DiseaseshState value, $Res Function(_DiseaseshState) then) =
      __$DiseaseshStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Option<Either<Failure, GlobalTotals>> globalTotalsOrFailure,
      bool isFetchingGlobalTotals});
}

class __$DiseaseshStateCopyWithImpl<$Res>
    extends _$DiseaseshStateCopyWithImpl<$Res>
    implements _$DiseaseshStateCopyWith<$Res> {
  __$DiseaseshStateCopyWithImpl(
      _DiseaseshState _value, $Res Function(_DiseaseshState) _then)
      : super(_value, (v) => _then(v as _DiseaseshState));

  @override
  _DiseaseshState get _value => super._value as _DiseaseshState;

  @override
  $Res call({
    Object globalTotalsOrFailure = freezed,
    Object isFetchingGlobalTotals = freezed,
  }) {
    return _then(_DiseaseshState(
      globalTotalsOrFailure: globalTotalsOrFailure == freezed
          ? _value.globalTotalsOrFailure
          : globalTotalsOrFailure as Option<Either<Failure, GlobalTotals>>,
      isFetchingGlobalTotals: isFetchingGlobalTotals == freezed
          ? _value.isFetchingGlobalTotals
          : isFetchingGlobalTotals as bool,
    ));
  }
}

class _$_DiseaseshState implements _DiseaseshState {
  const _$_DiseaseshState(
      {@required this.globalTotalsOrFailure,
      @required this.isFetchingGlobalTotals})
      : assert(globalTotalsOrFailure != null),
        assert(isFetchingGlobalTotals != null);

  @override
  final Option<Either<Failure, GlobalTotals>> globalTotalsOrFailure;
  @override
  final bool isFetchingGlobalTotals;

  @override
  String toString() {
    return 'DiseaseshState(globalTotalsOrFailure: $globalTotalsOrFailure, isFetchingGlobalTotals: $isFetchingGlobalTotals)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DiseaseshState &&
            (identical(other.globalTotalsOrFailure, globalTotalsOrFailure) ||
                const DeepCollectionEquality().equals(
                    other.globalTotalsOrFailure, globalTotalsOrFailure)) &&
            (identical(other.isFetchingGlobalTotals, isFetchingGlobalTotals) ||
                const DeepCollectionEquality().equals(
                    other.isFetchingGlobalTotals, isFetchingGlobalTotals)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(globalTotalsOrFailure) ^
      const DeepCollectionEquality().hash(isFetchingGlobalTotals);

  @override
  _$DiseaseshStateCopyWith<_DiseaseshState> get copyWith =>
      __$DiseaseshStateCopyWithImpl<_DiseaseshState>(this, _$identity);
}

abstract class _DiseaseshState implements DiseaseshState {
  const factory _DiseaseshState(
      {@required Option<Either<Failure, GlobalTotals>> globalTotalsOrFailure,
      @required bool isFetchingGlobalTotals}) = _$_DiseaseshState;

  @override
  Option<Either<Failure, GlobalTotals>> get globalTotalsOrFailure;
  @override
  bool get isFetchingGlobalTotals;
  @override
  _$DiseaseshStateCopyWith<_DiseaseshState> get copyWith;
}
