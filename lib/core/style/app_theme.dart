import 'package:flutter/material.dart';
import 'package:trainee_app/core/style/colors.dart';

class AppTheme {
  const AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    fontFamily: 'Montserrat',
    useMaterial3: true,
    scaffoldBackgroundColor: backgroundColorLight,
    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(backgroundColor: whiteColor),
    shadowColor: shadowColorLight,
    appBarTheme: const AppBarTheme(
      surfaceTintColor: backgroundColorLight,
      color: backgroundColorLight,
      elevation: 3,
      shadowColor: Colors.black45,
    ),
    extensions: const [
      AppColors(
        backgroundColor: backgroundColorLight,
        textColor: textColorLight,
        primaryColor: primaryColorLight,
        secondaryColor: secondaryColorLight,
        errorColor: errorColorLight,
        borderColor: borderColorLight,
        ratingActiveColor: ratingActiveColorLight,
        ratingInactiveColor: ratingInactiveColorLight,
      ),
    ],
  );
  static final ThemeData darkTheme = ThemeData(
    fontFamily: 'Montserrat',
    useMaterial3: true,
    scaffoldBackgroundColor: backgroundColorDark,
    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(backgroundColor: blackColor),
    shadowColor: shadowColorLight,
    appBarTheme: const AppBarTheme(
      surfaceTintColor: backgroundColorDark,
      color: backgroundColorDark,
      elevation: 3,
      shadowColor: Colors.white38,
    ),
    extensions: const [
      AppColors(
        backgroundColor: backgroundColorDark,
        textColor: textColorDark,
        primaryColor: primaryColorLight,
        secondaryColor: secondaryColorLight,
        errorColor: errorColorLight,
        borderColor: borderColorDark,
        ratingActiveColor: ratingActiveColorLight,
        ratingInactiveColor: ratingInactiveColorLight,
      ),
    ],
  );
}
