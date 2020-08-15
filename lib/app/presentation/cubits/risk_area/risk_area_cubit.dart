import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/plugins/error_mapper/error_mapper.dart';
import '../../../domain/entities/risk_area.dart';
import '../../../domain/repositories/diseasesh_repository.dart';

part 'risk_area_cubit.freezed.dart';
part 'risk_area_state.dart';

class RiskAreaCubit extends Cubit<RiskAreaState> {
  final DiseaseSHRepo _diseaseSHRepo;
  RiskAreaCubit(this._diseaseSHRepo) : super(const RiskAreaState.initial());

  Future<void> fetchRiskAreas() async {
    Either<Failure, List<RiskArea>> riskAreasOrFailure;
    emit(const RiskAreaState.loading());
    riskAreasOrFailure = await _diseaseSHRepo.fetchRiskAreas();
    if (riskAreasOrFailure.isRight()) {
      emit(RiskAreaState.loaded(
          riskAreasOrFailure.fold((_) => null, (riskAreas) => riskAreas)));
    } else {
      final failure =
          riskAreasOrFailure.fold((failure) => failure, (_) => null);
      emit(RiskAreaState.error(
          ErrorMapper(failure).mapErrorToHumanReadableMsg()));
    }
  }
}
