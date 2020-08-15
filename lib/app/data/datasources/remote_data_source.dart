import 'package:dio/dio.dart';

import '../../../core/constants/constants.dart';
import '../../../core/errors/exceptions.dart';
import '../models/country_totals_model.dart';
import '../models/global_totals_model.dart';
import '../models/risk_area_model.dart';
import '../models/vaccines_model.dart';

abstract class RemoteDataSource {
  Future<GlobalTotalsModel> fetchGlobalTotals();
  Future<CountryTotalsModel> fetchCountryTotals(String countryCode);
  Future<List<RiskAreaModel>> fetchRiskAreas();
  Future<VaccinesModel> fetchVaccines();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final Dio dio;
  final String rootUrl = Constants.REMOTE_DATA_SOURCE_DISEASESH_ROOT_URL;
  RemoteDataSourceImpl(this.dio);

  @override
  Future<GlobalTotalsModel> fetchGlobalTotals() async {
    Response response;
    try {
      response = await dio.get('$rootUrl/all');
    } catch (e) {
      throw ExternalException(e.toString());
    }

    if (response.statusCode == 200) {
      return GlobalTotalsModel.fromJson(response.data);
    } else if (response.statusCode == 500) {
      throw BadRequestException('code500');
    } else {
      throw ServerException('Something went wrong with the server.');
    }
  }

  @override
  Future<CountryTotalsModel> fetchCountryTotals(String countryCode) async {
    Response response;
    try {
      response = await dio
          .get('$rootUrl/countries/$countryCode?yesterday=false&strict=false');
    } catch (e) {
      throw ExternalException(e.toString());
    }
    if (response.statusCode == 200) {
      return CountryTotalsModel.fromJson(response.data);
    } else if (response.statusCode == 500) {
      throw BadRequestException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<RiskAreaModel>> fetchRiskAreas() async {
    Response response;
    try {
      response = await dio
          .get('https://5f33b126cfaf5a001646b1e5.mockapi.io/api/v1/all');
    } catch (e) {
      throw ExternalException(e.toString());
    }

    if (response.statusCode == 200) {
      return (response.data as List)
          .map((riskArea) => RiskAreaModel.fromJson(riskArea))
          .toList();
    } else if (response.statusCode == 404) {
      throw NotFoundException();
    } else if (response.statusCode == 500) {
      throw BadRequestException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<VaccinesModel> fetchVaccines() async {
    Response response;
    try {
      response = await dio.get('https://disease.sh/v3/covid-19/vaccine');
    } catch (e) {
      throw ExternalException(e.toString());
    }

    if (response.statusCode == 200) {
      return VaccinesModel.fromJson(response.data);
    } else if (response.statusCode == 404) {
      throw NotFoundException();
    } else if (response.statusCode == 500) {
      throw BadRequestException();
    } else {
      throw ServerException();
    }
  }
}
