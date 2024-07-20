import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trainee_app/core/localization_extension.dart';

class HelperMethods {
  static String formatStringDateToString(String input) {
    DateTime dateTime = DateTime.parse(input);
    String formattedDateTime =
        DateFormat('dd.MM.yyyy \'@\' HH:mm').format(dateTime);
    return formattedDateTime;
  }

  static getTrainingClassification(
      String classification, BuildContext context) {
    switch (classification.toLowerCase()) {
      case 'adults':
        return context.adults;
      case 'beginners':
        return context.beginners;
      case 'kids':
        return context.kids;
      case 'all':
        return context.all;
      default:
        return 'Unknown Classification';
    }
  }
}
