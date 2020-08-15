import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/plugins/error_mapper/error_mapper.dart';
import '../../../domain/entities/country_totals.dart';
import '../../../domain/repositories/diseasesh_repository.dart';

part 'country_cubit.freezed.dart';
part 'country_state.dart';

class CountryCubit extends Cubit<CountryState> {
  final DiseaseSHRepo _repository;
  CountryCubit(this._repository) : super(const CountryState.initial());

  Future<void> fetchCountryTotals() async {
    emit(const CountryState.loading());
    final countryOrFailure = await _repository.fetchCountryTotals();
    if (countryOrFailure.isRight()) {
      emit(CountryState.loaded(
          countryOrFailure.fold((_) => null, (countryTotal) => countryTotal)));
    } else {
      final failure = countryOrFailure.fold((failure) => failure, (_) => null);
      if (ErrorMapper(failure).isErrorPermissionDenied()) {
        emit(CountryState.permissionDenied(
            ErrorMapper(failure).mapErrorToHumanReadableMsg()));
      } else {
        emit(CountryState.error(
            ErrorMapper(failure).mapErrorToHumanReadableMsg()));
      }
    }
  }
}
