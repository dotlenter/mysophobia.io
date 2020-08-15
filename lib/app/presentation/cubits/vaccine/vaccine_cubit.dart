import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/plugins/error_mapper/error_mapper.dart';
import '../../../domain/entities/vaccines.dart';
import '../../../domain/repositories/diseasesh_repository.dart';

part 'vaccine_cubit.freezed.dart';
part 'vaccine_state.dart';

class VaccineCubit extends Cubit<VaccineState> {
  final DiseaseSHRepo _repository;

  VaccineCubit(this._repository) : super(const VaccineState.initial());

  Future<void> fetchVaccines() async {
    Either<Failure, Vaccines> vaccinesOrFailure;
    emit(const VaccineState.loading());
    vaccinesOrFailure = await _repository.fetchVaccines();
    vaccinesOrFailure.fold(
      (failure) => emit(VaccineState.error(
          ErrorMapper(failure).mapErrorToHumanReadableMsg())),
      (vaccines) => emit(VaccineState.loaded(vaccines)),
    );
  }
}
