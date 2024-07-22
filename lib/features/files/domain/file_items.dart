import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'file_items.g.dart';

@JsonSerializable()
class FileItems {
  final UniqueKey? key = UniqueKey();

  final int id;
  final String sectionName;
  final String name;
  final String createdAt;
  final String videoFileData;
  final String originalFileNameWithExtension;
  final String fileType;
  @JsonKey(fromJson: _colorFromJson, toJson: _colorToJson)
  final Color color;

  FileItems(
    this.id,
    this.sectionName,
    this.name,
    this.createdAt,
    this.videoFileData,
    this.originalFileNameWithExtension,
    this.fileType,
    this.color,
  );

  factory FileItems.fromJson(Map<String, dynamic> json) =>
      _$FileItemsFromJson(json);
  Map<String, dynamic> toJson() => _$FileItemsToJson(this);

  static Color _colorFromJson(String colorString) {
    return Color(int.parse(colorString.replaceFirst('#', '0xFF')));
  }

  static String _colorToJson(Color color) {
    return '#${color.value.toRadixString(16).padLeft(8, '0')}';
  }
}
