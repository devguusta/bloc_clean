import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBarThemeCore {
  static final AppBarTheme lighAppBarTime = AppBarTheme(
    color: Colors.transparent,
    iconTheme: const IconThemeData(color: Colors.black),
    toolbarTextStyle: const TextTheme(
      headline6: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
    ).bodyText2,
    titleTextStyle: const TextTheme(
      headline6: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
    ).headline6,
    systemOverlayStyle: SystemUiOverlayStyle.dark,
  );
  static final AppBarTheme darkAppBarTheme = AppBarTheme(
    color: Colors.black,
    iconTheme: const IconThemeData(color: Colors.orangeAccent),
    toolbarTextStyle: const TextTheme(
      headline6: TextStyle(
        color: Colors.orangeAccent,
        fontSize: 20,
      ),
    ).bodyText2,
  );
}

class ElevationButtonTheme {
  static final ElevatedButtonThemeData lightElevationButton =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: Colors.orange,
      textStyle: const TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    ),
  );

  static final ElevatedButtonThemeData darkElevationButton =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: Colors.white,
      textStyle: const TextStyle(
        color: Colors.orangeAccent,
        fontSize: 20,
      ),
    ),
  );
}
