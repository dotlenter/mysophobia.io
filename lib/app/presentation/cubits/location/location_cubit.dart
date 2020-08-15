import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../core/plugins/error_mapper/error_mapper.dart';
import '../../../domain/repositories/diseasesh_repository.dart';

part 'location_cubit.freezed.dart';
part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  final DiseaseSHRepo repository;
  StreamSubscription<Position> locationSubscription;

  LocationCubit(this.repository) : super(const LocationState.initial());

  Future<void> getLocationData() async {
    final locationStreamOrFailure = await repository.locationStream();
    if (locationStreamOrFailure.isRight()) {
      await locationSubscription?.cancel();
      locationSubscription = locationStreamOrFailure.fold(
          (_) => null,
          (stream) => stream
              .listen((position) => emit(LocationState.loaded(position))));
    } else {
      final failure =
          locationStreamOrFailure.fold((failure) => failure, (_) => null);
      if (ErrorMapper(failure).isErrorPermissionDenied()) {
        emit(LocationState.permissionDenied(
            ErrorMapper(failure).mapErrorToHumanReadableMsg()));
      } else {
        emit(LocationState.error(
            ErrorMapper(failure).mapErrorToHumanReadableMsg()));
      }
    }
  }

  Future<void> getDeviceLocation() async {
    final locationOrFailure = await repository.getDeviceLocation();
    locationOrFailure.fold(
      (failure) => emit(LocationState.error(
          ErrorMapper(failure).mapErrorToHumanReadableMsg())),
      (position) => emit(LocationState.loadLocation(position)),
    );
  }

  @override
  Future<void> close() {
    locationSubscription?.cancel();
    return super.close();
  }
}
