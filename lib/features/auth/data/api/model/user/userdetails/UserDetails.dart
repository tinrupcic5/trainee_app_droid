import 'package:trainee_app/features/school/domain/models/schooldetails/SchoolDetails.dart';
import 'package:trainee_app/features/settings/domain/model/Settings.dart';
import 'package:trainee_app/features/training/data/api/model/TrainingLevel.dart';

import '../User.dart';

class UserDetails {
  final int? id;
  final User user;
  final String name;
  final String lastName;
  final String? email;
  final String? phoneNumber;
  final SchoolDetails schoolDetails;
  final TrainingLevel? trainingLevel;
  final Settings settings;

  UserDetails({
    required this.id,
    required this.user,
    required this.name,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.schoolDetails,
    required this.trainingLevel,
    required this.settings,
  });
  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return UserDetails(
      id: json['id'],
      user: User.fromJson(json['user']),
      name: json['name'],
      lastName: json['lastName'],
      email: json['email'] != null ? json['email'] as String : null,
      phoneNumber:
          json['phoneNumber'] != null ? json['phoneNumber'] as String : null,
      schoolDetails: SchoolDetails.fromJson(json['schoolDetails']),
      trainingLevel: json['trainingLevel'] != null
          ? TrainingLevel.fromJson(json['trainingLevel'])
          : TrainingLevel(trainingLevelClassification: "", id: null),
      settings: json['settings'] != null
          ? Settings.fromJson(json['settings'])
          : Settings(language: 'HR'),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': user.toJson(),
      'name': name,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'schoolDetails': schoolDetails.toJson(),
      'trainingLevel': trainingLevel?.toJson(),
      'settings': settings.toJson(),
    };
  }
}
