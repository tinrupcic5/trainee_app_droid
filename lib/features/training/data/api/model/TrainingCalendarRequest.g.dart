// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TrainingCalendarRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainingCalendarRequest _$TrainingCalendarRequestFromJson(
        Map<String, dynamic> json) =>
    TrainingCalendarRequest(
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      trainingDetailsId: (json['trainingDetailsId'] as num).toInt(),
      trainingStatus: json['trainingStatus'] as bool,
      listOfTrainingLevelClassification:
          (json['listOfTrainingLevelClassification'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList(),
      schoolDetailsId: (json['schoolDetailsId'] as num).toInt(),
    );

Map<String, dynamic> _$TrainingCalendarRequestToJson(
        TrainingCalendarRequest instance) =>
    <String, dynamic>{
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'trainingDetailsId': instance.trainingDetailsId,
      'trainingStatus': instance.trainingStatus,
      'listOfTrainingLevelClassification':
          instance.listOfTrainingLevelClassification,
      'schoolDetailsId': instance.schoolDetailsId,
    };
