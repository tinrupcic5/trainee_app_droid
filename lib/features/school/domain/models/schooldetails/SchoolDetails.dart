import '../School.dart';

class SchoolDetails {
  final int? id;
  final School school;
  final String schoolLocation;
  final String schoolCountry;

  SchoolDetails(
      {required this.id,
      required this.school,
      required this.schoolLocation,
      required this.schoolCountry});

  factory SchoolDetails.fromJson(Map<String, dynamic> json) {
    return SchoolDetails(
        id: json['id'],
        school: School.fromJson(json['school']),
        schoolLocation: json['schoolLocation'],
        schoolCountry: json['schoolCountry']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'school': school.toJson(),
      'schoolLocation': schoolLocation,
      'schoolCountry': schoolCountry,
    };
  }
}
