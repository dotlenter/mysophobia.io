import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../entities/global_totals.dart';

abstract class DiseaseSHRepo {
  Future<Either<Failure, GlobalTotals>> fetchGlobalTotals();
}
