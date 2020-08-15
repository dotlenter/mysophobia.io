import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mysophobia_io/app/domain/entities/country_totals.dart';
import 'package:mysophobia_io/app/domain/repositories/diseasesh_repository.dart';
import 'package:mysophobia_io/app/presentation/cubits/country/country_cubit.dart';

class MockDiseaseSHRepo extends Mock implements DiseaseSHRepo {}

class MockCountryCubit extends MockBloc<CountryState> implements CountryCubit {}

void main() {
  MockDiseaseSHRepo mockDiseaseSHRepo;

  setUp(() {
    mockDiseaseSHRepo = MockDiseaseSHRepo();
  });

  mainCubit(mockDiseaseSHRepo);
}

final tCountryTotals = CountryTotals();

void mainCubit(MockDiseaseSHRepo mockDiseaseSHRepo) {
  group('CountryCubit', () {
    blocTest(
      'emits [] when nothing is called',
      build: () => CountryCubit(mockDiseaseSHRepo),
      expect: const <CountryState>[],
    );
    blocTest<CountryCubit, CountryState>(
      'emits [CountryState.loading, CountryState.loaded] when countryOrFailure isRight()',
      build: () => CountryCubit(mockDiseaseSHRepo),
      act: (cubit) async => cubit.fetchCountryTotals(),
      expect: <CountryState>[
        const CountryState.loading(),
        const CountryState.initial(),
        CountryState.loaded(tCountryTotals)
      ],
    );
  });
}
