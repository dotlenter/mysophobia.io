import 'dart:convert';

import 'package:mysophobia_io/core/errors/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/global_totals_model.dart';

abstract class LocalDataSource {
  Future<GlobalTotalsModel> fetchGlobalTotalsLocally();
  Future<void> saveGlobalTotalsLocally(GlobalTotalsModel globalTotalsModel);
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
}
