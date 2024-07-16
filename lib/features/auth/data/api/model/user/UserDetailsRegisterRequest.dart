import 'package:trainee_app/features/school/domain/models/SchoolDetailsRequest.dart';

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
}
