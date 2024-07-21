// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SchoolDetailsRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchoolDetailsRequest _$SchoolDetailsRequestFromJson(
        Map<String, dynamic> json) =>
    SchoolDetailsRequest(
      id: (json['id'] as num?)?.toInt(),
      school: SchoolRequest.fromJson(json['school'] as Map<String, dynamic>),
      schoolLocation: json['schoolLocation'] as String,
      schoolCountry: json['schoolCountry'] as String,
    );

Map<String, dynamic> _$SchoolDetailsRequestToJson(
        SchoolDetailsRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'school': instance.school,
      'schoolLocation': instance.schoolLocation,
      'schoolCountry': instance.schoolCountry,
    };
