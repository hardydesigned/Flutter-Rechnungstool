import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color _primaryColor = Color(0xff001219);
  static const Color _primaryContainerColor = Color(0xff005F73);
  static const Color _onPrimaryColor = Color.fromARGB(178, 0, 18, 25);

  static const Color _secondaryColor = Color(0xffE1E4E6);
//    static const Color _secondaryColor = Color(0xffE9D8A6);

  static const Color _secondaryContainerColor = Color(0xff94D2BD);
  static const Color _onSecondaryColor = Color(0xff0A9396);

  static const Color _tertiaryColor = Color(0xffEE9B00);
  static const Color _tertiaryContainerColor = Color(0xffCA6702);
  static const Color _onTertiaryColor = Color(0xffBB3E03);

  static const Color _outlineColor = Colors.white;
  static const Color _shadowColor = Colors.black;

  static const Color _errorColor = Color(0xffAE2012);
  static const Color _onErrorColor = Color(0xff9B2226);

  static const TextStyle _textPrimary = TextStyle(
      color: _primaryColor,
      fontFamily: "Product Sans",
      fontSize: 24,
      fontWeight: FontWeight.w500);

  static const TextStyle _textBoldPrimary = TextStyle(
      color: _primaryColor,
      fontFamily: "Product Sans",
      fontSize: 32,
      fontWeight: FontWeight.bold);

  static const TextStyle _textOnPrimary = TextStyle(
      color: _onPrimaryColor,
      fontFamily: "Product Sans",
      fontSize: 16,
      fontWeight: FontWeight.w500);

  static const TextStyle _textBoldOutline = TextStyle(
      color: _outlineColor,
      fontFamily: "Product Sans",
      fontWeight: FontWeight.bold,
      fontSize: 32);

  static const TextStyle _textOutline = TextStyle(
      color: _outlineColor,
      fontFamily: "Product Sans",
      fontWeight: FontWeight.w500,
      fontSize: 24);

  // ignore: unused_field
  static const TextStyle _textBlue = TextStyle(
      color: _primaryContainerColor,
      fontFamily: "Product Sans",
      fontWeight: FontWeight.w500,
      fontSize: 16);

  // ignore: unused_field
  static const TextStyle _textRed = TextStyle(
      color: _errorColor,
      fontFamily: "Product Sans",
      fontWeight: FontWeight.w500,
      fontSize: 16);

  // ignore: unused_field
  static const TextStyle _textGold = TextStyle(
      color: _tertiaryColor,
      fontFamily: "Product Sans",
      fontWeight: FontWeight.w500,
      fontSize: 32);

  static final TextTheme _lightTextTheme = TextTheme(
    displayLarge: _textBoldPrimary,
    displayMedium: _textPrimary,
    displaySmall: _textPrimary.copyWith(fontSize: 18),
    headlineLarge: _textBoldPrimary.copyWith(fontSize: 16),
    headlineMedium: _textPrimary.copyWith(fontSize: 14),
    headlineSmall: _textPrimary.copyWith(fontSize: 10),
    bodyLarge: _textOnPrimary,
    bodyMedium: _textOnPrimary.copyWith(fontSize: 14),
    titleLarge: _textBoldOutline,
    titleMedium: _textOutline,
    titleSmall: _textOutline.copyWith(fontSize: 18),
    labelLarge: _textBoldOutline.copyWith(fontSize: 16),
    labelMedium: _textOutline.copyWith(fontSize: 14),
    labelSmall: _textOutline.copyWith(fontSize: 10),
  );

  static final ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: _secondaryColor,
      appBarTheme: const AppBarTheme(
          color: _secondaryContainerColor,
          iconTheme: IconThemeData(color: _primaryColor)),
      bottomAppBarTheme: const BottomAppBarTheme(color: _primaryColor),
      colorScheme: const ColorScheme.light(
        shadow: _shadowColor,
        outline: _outlineColor,
        primary: _primaryColor,
        primaryContainer: _primaryContainerColor,
        onPrimary: _onPrimaryColor,
        secondary: _secondaryColor,
        secondaryContainer: _secondaryContainerColor,
        onSecondary: _onSecondaryColor,
        tertiary: _tertiaryColor,
        tertiaryContainer: _tertiaryContainerColor,
        onTertiary: _onTertiaryColor,
        error: _errorColor,
        onError: _onErrorColor,
      ),
      textTheme: _lightTextTheme);
}
