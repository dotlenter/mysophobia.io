import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../entities/country_totals.dart';
import '../repositories/diseasesh_repository.dart';

class FetchCountryTotals implements UseCase<CountryTotals, NoParams> {
  final DiseaseSHRepo repository;
  FetchCountryTotals(this.repository);

  @override
  Future<Either<Failure, CountryTotals>> call(NoParams params) =>
      repository.fetchCountryTotals();
}
