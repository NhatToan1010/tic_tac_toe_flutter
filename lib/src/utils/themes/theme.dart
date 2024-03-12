import 'package:flutter/material.dart';
import 'package:tic_tac_toe/src/utils/themes/widget_themes/buttonThemes.dart';
import 'package:tic_tac_toe/src/utils/themes/widget_themes/textThemes.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    textTheme: MyTextTheme.lightTextTheme,
    elevatedButtonTheme: MyButtonTheme.lightButtonTheme,
    iconButtonTheme: MyButtonTheme.lightIconButtonTheme,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blue,
    textTheme: MyTextTheme.darkTextTheme,
  );
}