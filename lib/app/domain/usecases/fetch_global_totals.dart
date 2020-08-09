import 'package:dartz/dartz.dart';
import 'package:mysophobia_io/app/domain/entities/global_totals.dart';
import 'package:mysophobia_io/app/domain/repositories/diseasesh_repository.dart';
import 'package:mysophobia_io/core/errors/failures.dart';
import 'package:mysophobia_io/core/usecases/usecase.dart';

class FetchGlobalTotals implements UseCase<GlobalTotals, NoParams> {
  final DiseaseSHRepo repository;
  FetchGlobalTotals(this.repository);
  @override
  Future<Either<Failure, GlobalTotals>> call(NoParams params) =>
      repository.fetchGlobalTotals();
}
