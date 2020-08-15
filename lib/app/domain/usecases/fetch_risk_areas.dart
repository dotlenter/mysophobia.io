import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../entities/risk_area.dart';
import '../repositories/diseasesh_repository.dart';

class FetchRiskAreas implements UseCase<List<RiskArea>, NoParams> {
  final DiseaseSHRepo repository;
  FetchRiskAreas(this.repository);

  @override
  Future<Either<Failure, List<RiskArea>>> call(NoParams params) =>
      repository.fetchRiskAreas();
}
