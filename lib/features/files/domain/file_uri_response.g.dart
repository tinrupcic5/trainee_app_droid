// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_uri_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileUriResponse _$FileUriResponseFromJson(Map<String, dynamic> json) =>
    FileUriResponse(
      type: json['type'] as String,
      classPath: json['classPath'] as String?,
      name: json['name'] as String?,
      suffix: json['suffix'] as String?,
      uri: json['uri'] as String?,
      contentComment: json['contentComment'] as String?,
      notificationMessage: json['notificationMessage'] as String?,
      createdAt: FileUriResponse._fromJson(json['createdAt'] as String),
    );

Map<String, dynamic> _$FileUriResponseToJson(FileUriResponse instance) =>
    <String, dynamic>{
      'type': instance.type,
      'classPath': instance.classPath,
      'name': instance.name,
      'suffix': instance.suffix,
      'uri': instance.uri,
      'contentComment': instance.contentComment,
      'notificationMessage': instance.notificationMessage,
      'createdAt': FileUriResponse._toJson(instance.createdAt),
    };
