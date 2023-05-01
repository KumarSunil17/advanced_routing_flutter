import 'package:flutter/material.dart';

///
/// Created by Sunil Kumar
/// On 29-04-2023 08:23 pm
///
mixin AppThemes {
  static const MaterialColor primary = MaterialColor(primaryValue, <int, Color>{
    50: Color(0xFFFCE3E1),
    100: Color(0xFFF7BAB5),
    200: Color(0xFFF28C83),
    300: Color(0xFFED5D51),
    400: Color(0xFFE93B2C),
    500: Color(primaryValue),
    600: Color(0xFFE21506),
    700: Color(0xFFDE1105),
    800: Color(0xFFDA0E04),
    900: Color(0xFFD30802),
  });
  static const int primaryValue = 0xFFE51807;
  static const Color background = Color(0xff292D32);
  static const Color canvas = Color(0xff2F323A);

  static final darkTheme = ThemeData(
      fontFamily: "Asap",
      canvasColor: canvas,
      scaffoldBackgroundColor: const Color(0xff414141),
      primaryColor: primary,
      cardColor: canvas,
      dialogBackgroundColor: canvas,
      textSelectionTheme: TextSelectionThemeData(
          cursorColor: primary,
          selectionHandleColor: primary,
          selectionColor: primary.withOpacity(0.3)),
      iconTheme: const IconThemeData(color: Colors.white),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: Brightness.dark,
      bottomNavigationBarTheme:
          const BottomNavigationBarThemeData(selectedItemColor: primary),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: primary, foregroundColor: Colors.white),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.transparent,
        titleTextStyle: TextStyle(
            fontSize: 20,
            fontFamily: "Asap",
            fontWeight: FontWeight.w700,
            color: Colors.white),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(foregroundColor: primary),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(vertical: 22, horizontal: 26)),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            backgroundColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return primary.shade900;
                } else if (states.contains(MaterialState.disabled)) {
                  return Colors.grey.shade500;
                } else if (states.contains(MaterialState.hovered)) {
                  return primary.shade300;
                }
                return primary;
              },
            )),
      ),
      colorScheme: ColorScheme.fromSwatch(
          primarySwatch: primary,
          cardColor: canvas,
          backgroundColor: background,
          brightness: Brightness.dark));
}
