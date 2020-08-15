import 'package:flutter/foundation.dart';

import '../../domain/entities/country_totals.dart';
import 'country_info_model.dart';

class CountryTotalsModel extends CountryTotals {
  final int updated;
  final String country;
  final CountryInfoModel countryInfo;
  final int cases;
  final int todayCases;
  final int deaths;
  final int todayDeaths;
  final int recovered;
  final int todayRecovered;
  final int active;
  final int critical;
  final double casesPerOneMillion;
  final double deathsPerOneMillion;
  final int tests;
  final double testsPerOneMillion;
  final int population;
  final String continent;
  final int oneCasePerPeople;
  final int oneDeathPerPeople;
  final int oneTestPerPeople;
  final double activePerOneMillion;
  final double recoveredPerOneMillion;
  final double criticalPerOneMillion;

  CountryTotalsModel({
    @required this.updated,
    @required this.country,
    @required this.countryInfo,
    @required this.cases,
    @required this.todayCases,
    @required this.deaths,
    @required this.todayDeaths,
    @required this.recovered,
    @required this.todayRecovered,
    @required this.active,
    @required this.critical,
    @required this.casesPerOneMillion,
    @required this.deathsPerOneMillion,
    @required this.tests,
    @required this.testsPerOneMillion,
    @required this.population,
    @required this.continent,
    @required this.oneCasePerPeople,
    @required this.oneDeathPerPeople,
    @required this.oneTestPerPeople,
    @required this.activePerOneMillion,
    @required this.recoveredPerOneMillion,
    @required this.criticalPerOneMillion,
  }) : super(
          updated: updated,
          country: country,
          countryInfo: countryInfo,
          cases: cases,
          todayCases: todayCases,
          deaths: deaths,
          todayDeaths: todayDeaths,
          recovered: recovered,
          todayRecovered: todayRecovered,
          active: active,
          critical: critical,
          casesPerOneMillion: casesPerOneMillion,
          deathsPerOneMillion: deathsPerOneMillion,
          tests: tests,
          testsPerOneMillion: testsPerOneMillion,
          population: population,
          continent: continent,
          oneCasePerPeople: oneCasePerPeople,
          oneDeathPerPeople: oneDeathPerPeople,
          oneTestPerPeople: oneTestPerPeople,
          activePerOneMillion: activePerOneMillion,
          recoveredPerOneMillion: recoveredPerOneMillion,
          criticalPerOneMillion: criticalPerOneMillion,
        );

  factory CountryTotalsModel.fromJson(Map<String, dynamic> json) =>
      CountryTotalsModel(
        updated: json['updated'],
        country: json['country'],
        countryInfo: CountryInfoModel.fromJson(json['countryInfo']),
        cases: json['cases'],
        todayCases: json['todayCases'],
        deaths: json['deaths'],
        todayDeaths: json['todayDeaths'],
        recovered: json['recovered'],
        todayRecovered: json['todayRecovered'],
        active: json['active'],
        critical: json['critical'],
        casesPerOneMillion: json['casesPerOneMillion'].toDouble(),
        deathsPerOneMillion: json['deathsPerOneMillion'].toDouble(),
        tests: json['tests'],
        testsPerOneMillion: json['testsPerOneMillion'].toDouble(),
        population: json['population'],
        continent: json['continent'],
        oneCasePerPeople: json['oneCasePerPeople'],
        oneDeathPerPeople: json['oneDeathPerPeople'],
        oneTestPerPeople: json['oneTestPerPeople'],
        activePerOneMillion: json['activePerOneMillion'].toDouble(),
        recoveredPerOneMillion: json['recoveredPerOneMillion'].toDouble(),
        criticalPerOneMillion: json['criticalPerOneMillion'].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'updated': updated,
        'country': country,
        'countryInfo': countryInfo.toJson(),
        'cases': cases,
        'todayCases': todayCases,
        'deaths': deaths,
        'todayDeaths': todayDeaths,
        'recovered': recovered,
        'todayRecovered': todayRecovered,
        'active': active,
        'critical': critical,
        'casesPerOneMillion': casesPerOneMillion,
        'deathsPerOneMillion': deathsPerOneMillion,
        'tests': tests,
        'testsPerOneMillion': testsPerOneMillion,
        'population': population,
        'continent': continent,
        'oneCasePerPeople': oneCasePerPeople,
        'oneDeathPerPeople': oneDeathPerPeople,
        'oneTestPerPeople': oneTestPerPeople,
        'activePerOneMillion': activePerOneMillion,
        'recoveredPerOneMillion': recoveredPerOneMillion,
        'criticalPerOneMillion': criticalPerOneMillion,
      };
}
