import 'package:flutter/foundation.dart';

import '../../domain/entities/risk_area.dart';

class RiskAreaModel extends RiskArea {
  RiskAreaModel({
    @required this.id,
    @required this.createdAt,
    @required this.placeCode,
    @required this.lat,
    @required this.lng,
    @required this.rad,
    @required this.isCovidHotspot,
    @required this.riskAssesment,
  }) : super(
          id: id,
          createdAt: createdAt,
          placeCode: placeCode,
          lat: lat,
          lng: lng,
          rad: rad,
          isCovidHotspot: isCovidHotspot,
          riskAssesment: riskAssesment,
        );

  final String id;
  final DateTime createdAt;
  final String placeCode;
  final double lat;
  final double lng;
  final int rad;
  final bool isCovidHotspot;
  final String riskAssesment;

  factory RiskAreaModel.fromJson(Map<String, dynamic> json) => RiskAreaModel(
        id: json['id'],
        createdAt: DateTime.parse(json['createdAt']),
        placeCode: json['placeCode'],
        lat: json['lat'].toDouble(),
        lng: json['lng'].toDouble(),
        rad: json['rad'],
        isCovidHotspot: json['isCovidHotspot'],
        riskAssesment: json['riskAssesment'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'createdAt': createdAt.toIso8601String(),
        'placeCode': placeCode,
        'lat': lat,
        'lng': lng,
        'rad': rad,
        'isCovidHotspot': isCovidHotspot,
        'riskAssesment': riskAssesment,
      };
}
