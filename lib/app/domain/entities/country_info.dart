import 'package:equatable/equatable.dart';

class CountryInfo extends Equatable {
  final int id;
  final String iso2;
  final String iso3;
  final int lat;
  final int long;
  final String flag;

  CountryInfo({this.id, this.iso2, this.iso3, this.lat, this.long, this.flag});

  @override
  List<Object> get props => [id, iso2, iso3, lat, long, flag];
}
