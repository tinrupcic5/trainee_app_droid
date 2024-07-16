import 'package:trainee_app/features/school/domain/models/SchoolRequest.dart';

class SchoolDetailsRequest {
  final SchoolRequest school;
  final String schoolLocation;
  final String schoolCountry;

  SchoolDetailsRequest({
    required this.school,
    required this.schoolLocation,
    required this.schoolCountry,
  });
}
