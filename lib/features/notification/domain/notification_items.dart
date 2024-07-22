import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification_items.g.dart';

@JsonSerializable()
class NotificationItems {
  @JsonKey()
  final UniqueKey? key = UniqueKey();

  final int notificationId;
  final String notificationMessage;
  final String createdAt;

  @JsonKey(fromJson: _colorFromJson, toJson: _colorToJson)
  final Color color;

  NotificationItems(
    this.notificationId,
    this.notificationMessage,
    this.createdAt,
    this.color,
  );

  factory NotificationItems.fromJson(Map<String, dynamic> json) =>
      _$NotificationItemsFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationItemsToJson(this);

  static Color _colorFromJson(String colorString) {
    return Color(int.parse(colorString.replaceFirst('#', '0xFF')));
  }

  static String _colorToJson(Color color) {
    return '#${color.value.toRadixString(16).padLeft(8, '0')}';
  }
}
