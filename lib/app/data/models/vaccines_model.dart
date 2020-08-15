import 'package:flutter/material.dart';

import '../../domain/entities/vaccines.dart';

class VaccinesModel extends Vaccines {
  VaccinesModel({
    @required this.source,
    @required this.totalCandidates,
    @required this.phases,
    @required this.data,
  }) : super(
          source: source,
          totalCandidates: totalCandidates,
          phases: phases,
          data: data,
        );

  final String source;
  final String totalCandidates;
  final List<VaccinePhaseModel> phases;
  final List<VaccineModel> data;

  factory VaccinesModel.fromJson(Map<String, dynamic> json) => VaccinesModel(
        source: json['source'],
        totalCandidates: json['totalCandidates'],
        phases: List<VaccinePhaseModel>.from(
            json['phases'].map((x) => VaccinePhaseModel.fromJson(x))),
        data: List<VaccineModel>.from(
            json['data'].map((x) => VaccineModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'source': source,
        'totalCandidates': totalCandidates,
        'phases': List<dynamic>.from(phases.map((x) => x.toJson())),
        'data': List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class VaccineModel extends Vaccine {
  VaccineModel({
    @required this.candidate,
    @required this.sponsors,
    @required this.details,
    @required this.trialPhase,
    @required this.institutions,
    @required this.funding,
  }) : super(
          candidate: candidate,
          sponsors: sponsors,
          details: details,
          trialPhase: trialPhase,
          institutions: institutions,
          funding: funding,
        );

  final String candidate;
  final List<String> sponsors;
  final String details;
  final String trialPhase;
  final List<String> institutions;
  final List<String> funding;

  factory VaccineModel.fromJson(Map<String, dynamic> json) => VaccineModel(
        candidate: json['candidate'],
        sponsors: List<String>.from(json['sponsors'].map((x) => x)),
        details: json['details'],
        trialPhase: json['trialPhase'],
        institutions: List<String>.from(json['institutions'].map((x) => x)),
        funding: List<String>.from(json['funding'].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        'candidate': candidate,
        'sponsors': List<dynamic>.from(sponsors.map((x) => x)),
        'details': details,
        'trialPhase': trialPhase,
        'institutions': List<dynamic>.from(institutions.map((x) => x)),
        'funding': List<dynamic>.from(funding.map((x) => x)),
      };
}

class VaccinePhaseModel extends VaccinePhase {
  VaccinePhaseModel({
    @required this.phase,
    @required this.candidates,
  }) : super(
          phase: phase,
          candidates: candidates,
        );

  final String phase;
  final String candidates;

  factory VaccinePhaseModel.fromJson(Map<String, dynamic> json) =>
      VaccinePhaseModel(
        phase: json['phase'],
        candidates: json['candidates'],
      );

  Map<String, dynamic> toJson() => {
        'phase': phase,
        'candidates': candidates,
      };
}
