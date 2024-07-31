// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileImage _$ProfileImageFromJson(Map<String, dynamic> json) => ProfileImage(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String,
      school: School.fromJson(json['school'] as Map<String, dynamic>),
      uri: json['uri'] as String,
      suffix: json['suffix'] as String,
      classPath: json['classPath'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$ProfileImageToJson(ProfileImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'school': instance.school,
      'uri': instance.uri,
      'suffix': instance.suffix,
      'classPath': instance.classPath,
      'createdAt': instance.createdAt,
    };
