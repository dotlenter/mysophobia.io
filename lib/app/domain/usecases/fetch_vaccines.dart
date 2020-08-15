import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../entities/vaccines.dart';
import '../repositories/diseasesh_repository.dart';

class FetchVaccines implements UseCase<Vaccines, NoParams> {
  final DiseaseSHRepo repository;
  FetchVaccines(this.repository);

  @override
  Future<Either<Failure, Vaccines>> call(NoParams params) =>
      repository.fetchVaccines();
}
