import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:trainee_app/core/localization_extension.dart';

String? validateEmail(final BuildContext context, final String? value) {
  if (value == null || value.isEmpty) {
    return context.localEmailEmptyValidation;
  }
  if (_isNotValidEmailAddress(value)) {
    return context.localEmailAddressValidation;
  }
  return null;
}

bool _isNotValidEmailAddress(final String value) => !RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
    .hasMatch(value);

String? validatePassword(final BuildContext context, final String? value) {
  if (value == null || value.isEmpty) {
    return context.localPasswordEmptyValidation;
  } else if (value.length < 2) {
    return context.localPasswordLengthValidation;
  } else {
    return null;
  }
}

bool doPasswordsMatch(final String password, final String confirmPassword) =>
    password == confirmPassword;

String parseStringToDate(String dateString) {
  final inputFormat = DateFormat('yyyy-MM-ddTHH:mm:ss.SSSSSS');
  final DateTime dateTime = inputFormat.parse(dateString);
  final outputFormat = DateFormat('dd.MM.yyyy');
  return outputFormat.format(dateTime);
}
