import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mysophobia_io/app/domain/repositories/diseasesh_repository.dart';

import '../../../../core/errors/failures.dart';
import '../../../domain/entities/global_totals.dart';

part 'diseasesh_state.dart';
part 'diseasesh_cubit.freezed.dart';

class DiseaseshCubit extends Cubit<DiseaseshState> {
  final DiseaseSHRepo _repository;

  DiseaseshCubit(this._repository) : super(DiseaseshState.initial());

  Future<void> fetchGlobalTotals() async {
    emit(DiseaseshState.initial().copyWith(isFetchingGlobalTotals: true));
    final Either<Failure, GlobalTotals> succeedOrFailure =
        await _repository.fetchGlobalTotals();
    emit(DiseaseshState.initial().copyWith(
      isFetchingGlobalTotals: true,
      globalTotalsOrFailure: optionOf(succeedOrFailure),
    ));
  }
}
