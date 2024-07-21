import 'package:trainee_app/features/training/data/api/model/Training.dart';

class TrainingCalendar {
  final int? id;
  final String trainingDate;
  final TrainingDetails trainingDetails;
  final bool trainingStatus;

  TrainingCalendar({
    this.id,
    required this.trainingDate,
    required this.trainingDetails,
    required this.trainingStatus,
  });

  factory TrainingCalendar.fromJson(Map<String, dynamic> json) {
    return TrainingCalendar(
      id: json['id'],
      trainingDate: json['trainingDate'],
      trainingDetails: TrainingDetails.fromJson(json['trainingDetails'] ?? {}),
      trainingStatus: json['trainingStatus'] ?? false,
    );
  }
}
