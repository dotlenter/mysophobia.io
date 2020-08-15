import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mysophobia_io/app/domain/repositories/diseasesh_repository.dart';
import 'package:mysophobia_io/core/plugins/error_mapper/error_mapper.dart';

import '../../../../core/errors/failures.dart';
import '../../../domain/entities/global_totals.dart';

part 'diseasesh_state.dart';
part 'diseasesh_cubit.freezed.dart';

class DiseaseshCubit extends Cubit<DiseaseshState> {
  final DiseaseSHRepo _repository;

  DiseaseshCubit(this._repository) : super(const DiseaseshState.initial());

  Future<void> fetchGlobalTotals() async {
    emit(const DiseaseshState.loading());
    final Either<Failure, GlobalTotals> globalOrFailure =
        await _repository.fetchGlobalTotals();
    if (globalOrFailure.isRight()) {
      emit(DiseaseshState.loaded(
          globalOrFailure.fold((_) => null, (global) => global)));
    } else {
      final error = globalOrFailure.fold((failure) => failure, (r) => null);
      emit(DiseaseshState.error(
          ErrorMapper(error).mapErrorToHumanReadableMsg()));
    }
  }
}
