class TrainingParticipationRequest {
  final int? id;
  final int trainingCalendarId;
  final int userId;
  final bool attendedStatus;

  TrainingParticipationRequest({
    this.id,
    required this.trainingCalendarId,
    required this.userId,
    required this.attendedStatus,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'trainingCalendarId': trainingCalendarId,
      'userId': userId,
      'attendedStatus': attendedStatus,
    };
  }
}
