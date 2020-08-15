import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/errors/exceptions.dart';
import '../models/country_totals_model.dart';
import '../models/global_totals_model.dart';
import '../models/vaccines_model.dart';

abstract class LocalDataSource {
  Future<GlobalTotalsModel> fetchGlobalTotalsLocally();
  Future<void> saveGlobalTotalsLocally(GlobalTotalsModel globalTotalsModel);
  Future<CountryTotalsModel> fetchCountryTotalsLocally();
  Future<void> saveCountryTotalsLocally(CountryTotalsModel countryTotalsModel);
  Future<void> saveRemoteVaccinesLocally(VaccinesModel vaccinesModel);
  Future<VaccinesModel> fetchVaccinesLocally();
}

class LocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences _sharedPreferences;
  LocalDataSourceImpl(this._sharedPreferences);

  @override
  Future<GlobalTotalsModel> fetchGlobalTotalsLocally() async {
    final jsonString = await _sharedPreferences.getString('0xosGT');
    if (jsonString != null) {
      return await GlobalTotalsModel.fromJson(jsonDecode(jsonString));
    }
    throw CacheException(
        'Something went wrong caching GlobalTotalsModel. #0xosGT');
  }

  @override
  Future<void> saveGlobalTotalsLocally(
      GlobalTotalsModel globalTotalsModel) async {
    try {
      await _sharedPreferences.setString(
          '0xosGT', jsonEncode(globalTotalsModel.toJson()));
    } catch (e) {
      throw CacheException(e.toString());
    }
  }

  @override
  Future<CountryTotalsModel> fetchCountryTotalsLocally() async {
    final jsonString = await _sharedPreferences.getString('0xosCT');
    if (jsonString != null) {
      return await CountryTotalsModel.fromJson(jsonDecode(jsonString));
    }
    throw CacheException(
        'Something went wrong caching GlobalTotalsModel. #0xosCT');
  }

  @override
  Future<void> saveCountryTotalsLocally(
      CountryTotalsModel countryTotalsModel) async {
    try {
      await _sharedPreferences.setString(
          '0xosCT', jsonEncode(countryTotalsModel.toJson()));
    } catch (e) {
      throw CacheException(e.toString());
    }
  }

  @override
  Future<VaccinesModel> fetchVaccinesLocally() async {
    final jsonString = await _sharedPreferences.getString('0xosVac');
    if (jsonString != null) {
      return await VaccinesModel.fromJson(jsonDecode(jsonString));
    }
    throw CacheException();
  }

  @override
  Future<void> saveRemoteVaccinesLocally(VaccinesModel vaccinesModel) async {
    try {
      await _sharedPreferences.setString(
          '0xosVac', jsonEncode(vaccinesModel.toJson()));
    } catch (e) {
      throw CacheException(e.toString());
    }
  }
}
