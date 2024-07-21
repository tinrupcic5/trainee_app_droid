// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserDetailsRegisterRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetailsRegisterRequest _$UserDetailsRegisterRequestFromJson(
        Map<String, dynamic> json) =>
    UserDetailsRegisterRequest(
      name: json['name'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      schoolDetailsRequest: SchoolDetailsRequest.fromJson(
          json['schoolDetailsRequest'] as Map<String, dynamic>),
      trainingLevel: json['trainingLevel'] as String,
    );

Map<String, dynamic> _$UserDetailsRegisterRequestToJson(
        UserDetailsRegisterRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'lastName': instance.lastName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'schoolDetailsRequest': instance.schoolDetailsRequest,
      'trainingLevel': instance.trainingLevel,
    };
