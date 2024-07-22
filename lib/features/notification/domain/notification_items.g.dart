// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationItems _$NotificationItemsFromJson(Map<String, dynamic> json) =>
    NotificationItems(
      (json['notificationId'] as num).toInt(),
      json['notificationMessage'] as String,
      json['createdAt'] as String,
      NotificationItems._colorFromJson(json['color'] as String),
    );

Map<String, dynamic> _$NotificationItemsToJson(NotificationItems instance) =>
    <String, dynamic>{
      'notificationId': instance.notificationId,
      'notificationMessage': instance.notificationMessage,
      'createdAt': instance.createdAt,
      'color': NotificationItems._colorToJson(instance.color),
    };
