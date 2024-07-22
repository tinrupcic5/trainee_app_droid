// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileItems _$FileItemsFromJson(Map<String, dynamic> json) => FileItems(
      (json['id'] as num).toInt(),
      json['sectionName'] as String,
      json['name'] as String,
      json['createdAt'] as String,
      json['videoFileData'] as String,
      json['originalFileNameWithExtension'] as String,
      json['fileType'] as String,
      FileItems._colorFromJson(json['color'] as String),
    );

Map<String, dynamic> _$FileItemsToJson(FileItems instance) => <String, dynamic>{
      'id': instance.id,
      'sectionName': instance.sectionName,
      'name': instance.name,
      'createdAt': instance.createdAt,
      'videoFileData': instance.videoFileData,
      'originalFileNameWithExtension': instance.originalFileNameWithExtension,
      'fileType': instance.fileType,
      'color': FileItems._colorToJson(instance.color),
    };
