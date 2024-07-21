import 'package:trainee_app/features/auth/data/api/model/user/userdetails/UserDetails.dart';
import 'package:trainee_app/features/calendar/data/api/model/TrainingCalendar.dart';

class Participation {
  final int? id;
  final TrainingCalendar trainingCalendar;
  final UserDetails? userDetails;
  final bool attendedStatus;

  Participation({
    this.id,
    required this.trainingCalendar,
    required this.userDetails,
    required this.attendedStatus,
  });

  factory Participation.fromJson(Map<String, dynamic> json) {
    return Participation(
      id: json['id'],
      trainingCalendar: TrainingCalendar.fromJson(json['trainingCalendar']),
      userDetails: UserDetails.fromJson(json['userDetails']),
      attendedStatus: json['attendedStatus'] as bool? ?? false,
    );
  }
}
