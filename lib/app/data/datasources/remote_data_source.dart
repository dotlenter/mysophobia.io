import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mysophobia_io/app/data/models/global_totals_model.dart';
import 'package:mysophobia_io/core/constants/constants.dart';
import 'package:mysophobia_io/core/errors/exceptions.dart';

abstract class RemoteDataSource{
  Future<GlobalTotalsModel> fetchGlobalTotals();
}

class RemoteDataSourceImpl implements RemoteDataSource{
  final Dio dio;
  final String rootUrl = Constants.REMOTE_DATA_SOURCE_DISEASESH_ROOT_URL;
  RemoteDataSourceImpl(this.dio);

  @override
  Future<GlobalTotalsModel> fetchGlobalTotals() async {
    Response response = await dio.get('$rootUrl/all');

    if(response.statusCode == 200){
      return GlobalTotalsModel.fromJson(json.decode(response.data));
    }else if(response.statusCode == 500){
      throw BadRequestException('code500');
    }else{
      throw ServerException('Something went wrong with the server.');
    }
  }

}