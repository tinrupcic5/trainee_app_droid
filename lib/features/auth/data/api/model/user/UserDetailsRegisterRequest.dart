import 'package:trainee_app/features/school/domain/models/SchoolDetailsRequest.dart';
import 'package:json_annotation/json_annotation.dart';

part 'UserDetailsRegisterRequest.g.dart';

@JsonSerializable()
class UserDetailsRegisterRequest {
  final String name;
  final String lastName;
  final String email;
  final String phoneNumber;
  final SchoolDetailsRequest schoolDetailsRequest;
  final String trainingLevel;

  UserDetailsRegisterRequest({
    required this.name,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.schoolDetailsRequest,
    required this.trainingLevel,
  });

  factory UserDetailsRegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$UserDetailsRegisterRequestFromJson(json);
  Map<String, dynamic> toJson() => _$UserDetailsRegisterRequestToJson(this);
}
