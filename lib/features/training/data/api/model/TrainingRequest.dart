import 'package:trainee_app/features/auth/data/api/model/user/UserDetailsRegisterRequest.dart';
import 'package:trainee_app/features/school/domain/models/SchoolDetailsRequest.dart';
import 'package:json_annotation/json_annotation.dart';

part 'TrainingRequest.g.dart';

@JsonSerializable()
class TrainingRequest {
  final int? id;
  final String name;
  final String type;
  final SchoolDetailsRequest schoolDetails;
  final UserDetailsRegisterRequest createdBy;
  final DateTime createdAt;
  final String trainingTime;
  final bool trainingStatus;
  final String trainingLevel;

  TrainingRequest({
    this.id,
    required this.name,
    required this.type,
    required this.schoolDetails,
    required this.createdBy,
    required this.createdAt,
    required this.trainingTime,
    required this.trainingStatus,
    required this.trainingLevel,
  });

  // From JSON
  factory TrainingRequest.fromJson(Map<String, dynamic> json) =>
      _$TrainingRequestFromJson(json);

  // To JSON
  Map<String, dynamic> toJson() => _$TrainingRequestToJson(this);
}
