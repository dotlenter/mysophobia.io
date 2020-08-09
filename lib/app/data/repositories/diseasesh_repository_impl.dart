import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:mysophobia_io/app/data/datasources/local_data_source.dart';
import 'package:mysophobia_io/app/data/datasources/remote_data_source.dart';
import 'package:mysophobia_io/core/errors/exceptions.dart';
import 'package:mysophobia_io/core/network/network_info.dart';

import '../../../core/errors/failures.dart';
import '../../domain/entities/global_totals.dart';
import '../../domain/repositories/diseasesh_repository.dart';

class DiseaseSHRepoImpl implements DiseaseSHRepo {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  final NetworkInfo networkInfo;
  DiseaseSHRepoImpl({
    @required this.networkInfo,
    @required this.remoteDataSource,
    @required this.localDataSource,
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
}
