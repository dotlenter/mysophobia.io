// To parse this JSON data, do
//
//     final vaccineModel = vaccineModelFromJson(jsonString);

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

// VaccineModel vaccineModelFromJson(String str) => VaccineModel.fromJson(json.decode(str));

// String vaccineModelToJson(VaccineModel data) => json.encode(data.toJson());

class Vaccines extends Equatable {
  Vaccines({
    @required this.source,
    @required this.totalCandidates,
    @required this.phases,
    @required this.data,
  });

  final String source;
  final String totalCandidates;
  final List<VaccinePhase> phases;
  final List<Vaccine> data;

  @override
  List<Object> get props => [source, totalCandidates, phases, data];
}

class Vaccine extends Equatable {
  Vaccine({
    @required this.candidate,
    @required this.sponsors,
    @required this.details,
    @required this.trialPhase,
    @required this.institutions,
    @required this.funding,
  });

  final String candidate;
  final List<String> sponsors;
  final String details;
  final String trialPhase;
  final List<String> institutions;
  final List<String> funding;

  @override
  List<Object> get props =>
      [candidate, sponsors, details, trialPhase, institutions, funding];
}

class VaccinePhase extends Equatable {
  VaccinePhase({
    @required this.phase,
    @required this.candidates,
  });

  final String phase;
  final String candidates;

  @override
  List<Object> get props => [phase, candidates];
}
