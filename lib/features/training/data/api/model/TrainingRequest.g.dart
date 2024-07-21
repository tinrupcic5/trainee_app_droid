// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TrainingRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainingRequest _$TrainingRequestFromJson(Map<String, dynamic> json) =>
    TrainingRequest(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String,
      type: json['type'] as String,
      schoolDetails: SchoolDetailsRequest.fromJson(
          json['schoolDetails'] as Map<String, dynamic>),
      createdBy: UserDetailsRegisterRequest.fromJson(
          json['createdBy'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
      trainingTime: json['trainingTime'] as String,
      trainingStatus: json['trainingStatus'] as bool,
      trainingLevel: json['trainingLevel'] as String,
    );

Map<String, dynamic> _$TrainingRequestToJson(TrainingRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'schoolDetails': instance.schoolDetails,
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt.toIso8601String(),
      'trainingTime': instance.trainingTime,
      'trainingStatus': instance.trainingStatus,
      'trainingLevel': instance.trainingLevel,
    };
