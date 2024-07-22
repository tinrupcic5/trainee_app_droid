import 'package:flutter/material.dart';

class CalendarItemModel {
  UniqueKey? key = UniqueKey();
  final int trainingId;
  final String trainingName;
  final bool trainingStatus;
  final String trainingTime;
  final String trainingLevel;
  final bool attendedStatus;
  final Color color;
  CalendarItemModel(
    this.trainingId,
    this.trainingName,
    this.trainingTime,
    this.trainingLevel,
    this.attendedStatus,
    this.trainingStatus,
    this.color,
  );
}
