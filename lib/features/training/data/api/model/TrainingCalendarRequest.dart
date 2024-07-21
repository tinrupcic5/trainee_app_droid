import 'package:json_annotation/json_annotation.dart';

part 'TrainingCalendarRequest.g.dart';

@JsonSerializable()
class TrainingCalendarRequest {
  final DateTime startDate; // training date
  final DateTime endDate; // until the date
  final int trainingDetailsId;
  final bool trainingStatus;
  final List<int>? listOfTrainingLevelClassification;
  final int schoolDetailsId;

  TrainingCalendarRequest({
    required this.startDate,
    required this.endDate,
    required this.trainingDetailsId,
    required this.trainingStatus,
    this.listOfTrainingLevelClassification,
    required this.schoolDetailsId,
  });

  // From JSON
  factory TrainingCalendarRequest.fromJson(Map<String, dynamic> json) =>
      _$TrainingCalendarRequestFromJson(json);

  // To JSON
  Map<String, dynamic> toJson() => _$TrainingCalendarRequestToJson(this);
}
