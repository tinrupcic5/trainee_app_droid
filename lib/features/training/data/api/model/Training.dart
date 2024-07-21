import 'package:trainee_app/features/auth/data/api/model/user/userdetails/UserDetails.dart';
import 'package:trainee_app/features/participation/domain/models/Participation.dart';
import 'package:trainee_app/features/school/domain/models/schooldetails/SchoolDetails.dart';
import 'package:trainee_app/features/training/data/api/model/TrainingLevel.dart';

class TrainingDetails {
  final int? id;
  final String name;
  final String type;
  final SchoolDetails schoolDetails;
  final UserDetails createdBy;
  final String createdAt;
  final String trainingTime;
  final bool trainingStatus;
  final TrainingLevel trainingLevel;
  final List<Participation> participation;
  final int? trainingCalendarId;

  TrainingDetails({
    required this.id,
    required this.name,
    required this.type,
    required this.schoolDetails,
    required this.createdBy,
    required this.createdAt,
    required this.trainingTime,
    required this.trainingStatus,
    required this.participation,
    required this.trainingLevel,
    required this.trainingCalendarId,
  });

  factory TrainingDetails.fromJson(Map<String, dynamic> json) {
    return TrainingDetails(
      id: json['id'],
      name: json['name'] ?? '',
      type: json['type'] ?? '',
      schoolDetails: SchoolDetails.fromJson(json['schoolDetails'] ?? {}),
      createdBy: UserDetails.fromJson(json['createdBy'] ?? {}),
      createdAt: json['createdAt'] ?? '',
      trainingTime: json['trainingTime'] ?? '',
      trainingStatus: json['trainingStatus'] ?? false,
      trainingLevel: TrainingLevel.fromJson(json['trainingLevel'] ?? {}),
      participation: (json['participation'] as List<dynamic>?)
              ?.map((item) => Participation.fromJson(item))
              .toList() ??
          [],
      trainingCalendarId: json['trainingCalendarId'],
    );
  }
}
