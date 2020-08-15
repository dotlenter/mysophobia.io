import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class RiskArea extends Equatable {
  RiskArea({
    @required this.id,
    @required this.createdAt,
    @required this.placeCode,
    @required this.lat,
    @required this.lng,
    @required this.rad,
    @required this.isCovidHotspot,
    @required this.riskAssesment,
  });

  final String id;
  final DateTime createdAt;
  final String placeCode;
  final double lat;
  final double lng;
  final int rad;
  final bool isCovidHotspot;
  final String riskAssesment;

  @override
  List<Object> get props =>
      [id, createdAt, placeCode, lat, lng, rad, isCovidHotspot, riskAssesment];
}
