import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../repositories/diseasesh_repository.dart';

class LocationStream
    implements UseCase<Stream<Position>, NoParams> {
  final DiseaseSHRepo repository;
  LocationStream(this.repository);

  @override
  Future<Either<Failure, Stream<Position>>> call(NoParams params) =>
      repository.locationStream();
}
