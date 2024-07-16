import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension LocalizationExtension on BuildContext {
  String get localSignInTitle => AppLocalizations.of(this)!.signInTitle;
  String get localEmail => AppLocalizations.of(this)!.email;
  String get localPassword => AppLocalizations.of(this)!.password;
  String get localForgotPassword => AppLocalizations.of(this)!.forgotPassword;
  String get localSignIn => AppLocalizations.of(this)!.signIn;
  String get localDontHaveAccount =>
      AppLocalizations.of(this)!.dontHaveAnAccount;
  String get localCreateAccount => AppLocalizations.of(this)!.createAccount;
  String get localSignUpTitle => AppLocalizations.of(this)!.signUpTitle;
  String get localAlreadyHaveAnAccount =>
      AppLocalizations.of(this)!.alreadyHaveAnAccount;
  String get localSignUp => AppLocalizations.of(this)!.signUp;
  String get localResetPassword => AppLocalizations.of(this)!.resetPassword;
  String get localReset => AppLocalizations.of(this)!.reset;
  String get localResetPasswordTitle =>
      AppLocalizations.of(this)!.resetPasswordTitle;
  String get localVerificationEmail =>
      AppLocalizations.of(this)!.verificationEmail;
  String get localEmailEmptyValidation =>
      AppLocalizations.of(this)!.emailEmptyValidation;
  String get localEmailAddressValidation =>
      AppLocalizations.of(this)!.emailAddressValidation;
  String get localPasswordEmptyValidation =>
      AppLocalizations.of(this)!.passwordEmptyValidation;
  String get localPasswordLengthValidation =>
      AppLocalizations.of(this)!.passwordLengthValidation;
  String get localPasswordComplexityValidation =>
      AppLocalizations.of(this)!.passwordComplexityValidation;
  String get localWrongEmailOrPassword =>
      AppLocalizations.of(this)!.wrongEmailOrPassword;
  String get localPasswordsDoNotMatch =>
      AppLocalizations.of(this)!.passwordsDoNotMatch;
  String get localEmailAlreadyExists =>
      AppLocalizations.of(this)!.emailAlreadyExists;
  String get localPasswordIsTooWeak =>
      AppLocalizations.of(this)!.passwordIsTooWeak;
  String get localThereWasAnError => AppLocalizations.of(this)!.thereWasAnError;
  ///////
  String get calendarPage => AppLocalizations.of(this)!.calendar;
  String get myProfilePage => AppLocalizations.of(this)!.profile;
  String get summaryPage => AppLocalizations.of(this)!.summary;
}
