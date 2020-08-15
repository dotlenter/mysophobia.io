import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

import '../../../core/errors/exceptions.dart';
import '../../../core/errors/failures.dart';
import '../../../core/network/network_info.dart';
import '../../../core/permissions/permission_info.dart';
import '../../domain/entities/country_totals.dart';
import '../../domain/entities/global_totals.dart';
import '../../domain/entities/risk_area.dart';
import '../../domain/entities/vaccines.dart';
import '../../domain/repositories/diseasesh_repository.dart';
import '../datasources/local_data_source.dart';
import '../datasources/location_info.dart';
import '../datasources/remote_data_source.dart';

class DiseaseSHRepoImpl implements DiseaseSHRepo {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  final NetworkInfo networkInfo;
  final PermissionInfo permissionInfo;
  final LocationInfo locationInfo;

  DiseaseSHRepoImpl({
    @required this.networkInfo,
    @required this.remoteDataSource,
    @required this.localDataSource,
    @required this.permissionInfo,
    @required this.locationInfo,
  });

  @override
  Future<Either<Failure, GlobalTotals>> fetchGlobalTotals() async {
    if (await networkInfo.isConnected) {
      try {
        final globalTotalsRemote = await remoteDataSource.fetchGlobalTotals();
        await localDataSource.saveGlobalTotalsLocally(globalTotalsRemote);
        return right(globalTotalsRemote);
      } on ServerException {
        return left(const Failure.serverError());
      } on SocketException {
        return left(const Failure.socketError());
      } on ExternalException {
        return left(const Failure.invalid());
      }
    } else {
      try {
        final globalTotalsRemote =
            await localDataSource.fetchGlobalTotalsLocally();
        return right(globalTotalsRemote);
      } on CacheException {
        return left(const Failure.cachingError());
      }
    }
  }

  @override
  Future<Either<Failure, CountryTotals>> fetchCountryTotals() async {
    if (await networkInfo.isConnected) {
      if (await permissionInfo.isLocationPermissionGranted) {
        try {
          final countryName = await locationInfo.getCountryNameLocalle();
          final countryTotalsRemote =
              await remoteDataSource.fetchCountryTotals(countryName);
          await localDataSource.saveCountryTotalsLocally(countryTotalsRemote);
          return right(countryTotalsRemote);
        } on PermissionDeniedException {
          return left(const Failure.permissionDeniedError());
        } on BadRequestException {
          return left(const Failure.emptyError());
        } on NotFoundException {
          return left(const Failure.notFoundError());
        } on ServerException {
          return left(const Failure.serverError());
        } on SocketException {
          return left(const Failure.socketError());
        } on ExternalException {
          return left(const Failure.invalid());
        }
      } else {
        return left(const Failure.permissionDeniedError());
      }
    } else {
      try {
        final countryTotalsLocal =
            await localDataSource.fetchCountryTotalsLocally();
        return right(countryTotalsLocal);
      } on CacheException {
        return left(const Failure.cachingError());
      }
    }
  }

  @override
  Future<Either<Failure, Stream<Position>>> locationStream() async {
    if (await permissionInfo.isLocationPermissionGranted) {
      try {
        return right(locationInfo.locationStream());
      } on LocationException {
        return left(const Failure.locationError());
      }
    } else {
      return left(const Failure.permissionDeniedError());
    }
  }

  @override
  Future<Either<Failure, List<RiskArea>>> fetchRiskAreas() async {
    if (await networkInfo.isConnected) {
      try {
        final areas = await remoteDataSource.fetchRiskAreas();
        return right(areas);
      } on NotFoundException {
        return left(const Failure.notFoundError());
      } on ServerException {
        return left(const Failure.serverError());
      } on SocketException {
        return left(const Failure.socketError());
      } on ExternalException {
        return left(const Failure.invalid());
      }
    } else {
      return left(const Failure.networkError());
    }
  }

  @override
  Future<Either<Failure, Vaccines>> fetchVaccines() async {
    if (await networkInfo.isConnected) {
      try {
        final vaccinesRemote = await remoteDataSource.fetchVaccines();
        await localDataSource.saveRemoteVaccinesLocally(vaccinesRemote);
        return right(vaccinesRemote);
      } on ServerException {
        return left(const Failure.serverError());
      } on BadRequestException {
        return left(const Failure.emptyError());
      } on SocketException {
        return left(const Failure.socketError());
      } on ExternalException {
        return left(const Failure.invalid());
      } on NotFoundException {
        return left(const Failure.notFoundError());
      }
    } else {
      try {
        final vaccinesLocal = await localDataSource.fetchVaccinesLocally();
        return right(vaccinesLocal);
      } on CacheException {
        return left(const Failure.cachingError());
      }
    }
  }

  @override
  Future<Either<Failure, Position>> getDeviceLocation() async {
    if (await permissionInfo.isLocationPermissionGranted) {
      final deviceLocation = await locationInfo.getDevicePosition();
      return right(deviceLocation);
    } else {
      return left(const Failure.permissionDeniedError());
    }
  }
}
