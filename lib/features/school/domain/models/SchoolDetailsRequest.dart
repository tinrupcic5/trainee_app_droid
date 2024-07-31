import 'package:trainee_app/features/school/domain/models/SchoolRequest.dart';
import 'package:json_annotation/json_annotation.dart';

part 'SchoolDetailsRequest.g.dart';

@JsonSerializable()
class SchoolDetailsRequest {
  final int? id;
  final SchoolRequest school;
  final String schoolLocation;
  final String schoolCountry;

  SchoolDetailsRequest({
    this.id,
    required this.school,
    required this.schoolLocation,
    required this.schoolCountry,
  });

  // From JSON
  factory SchoolDetailsRequest.fromJson(Map<String, dynamic> json) =>
      _$SchoolDetailsRequestFromJson(json);

  // To JSON
  Map<String, dynamic> toJson() => _$SchoolDetailsRequestToJson(this);
}
