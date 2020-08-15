import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mysophobia_io/app/domain/entities/risk_area.dart';
import 'package:mysophobia_io/app/domain/entities/vaccines.dart';

import '../../../core/errors/failures.dart';
import '../entities/country_totals.dart';
import '../entities/global_totals.dart';

abstract class DiseaseSHRepo {
  Future<Either<Failure, GlobalTotals>> fetchGlobalTotals();
  Future<Either<Failure, CountryTotals>> fetchCountryTotals();
  Future<Either<Failure, Stream<Position>>> locationStream();
  Future<Either<Failure, Position>> getDeviceLocation();
  Future<Either<Failure, List<RiskArea>>> fetchRiskAreas();
  Future<Either<Failure, Vaccines>> fetchVaccines();
}
