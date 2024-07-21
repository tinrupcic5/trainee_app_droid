// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SchoolRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchoolRequest _$SchoolRequestFromJson(Map<String, dynamic> json) =>
    SchoolRequest(
      schoolId: (json['schoolId'] as num?)?.toInt(),
      schoolName: json['schoolName'] as String,
    );

Map<String, dynamic> _$SchoolRequestToJson(SchoolRequest instance) =>
    <String, dynamic>{
      'schoolId': instance.schoolId,
      'schoolName': instance.schoolName,
    };
