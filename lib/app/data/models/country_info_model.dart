import 'package:flutter/foundation.dart';

import '../../domain/entities/country_info.dart';

class CountryInfoModel extends CountryInfo {
  final int id;
  final String iso2;
  final String iso3;
  final int lat;
  final int long;
  final String flag;
  CountryInfoModel({
    @required this.id,
    @required this.iso2,
    @required this.iso3,
    @required this.lat,
    @required this.long,
    @required this.flag,
  }) : super(
          id: id,
          iso2: iso2,
          iso3: iso3,
          lat: lat,
          long: long,
          flag: flag,
        );

  factory CountryInfoModel.fromJson(Map<String, dynamic> json) =>
      CountryInfoModel(
        id: json['_id'],
        iso2: json['iso2'],
        iso3: json['iso3'],
        lat: json['lat'],
        long: json['long'],
        flag: json['flag'],
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'iso2': iso2,
        'iso3': iso3,
        'lat': lat,
        'long': long,
        'flag': flag,
      };
}
