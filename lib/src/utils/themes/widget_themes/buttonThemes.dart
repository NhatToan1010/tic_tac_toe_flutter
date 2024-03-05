import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';

class MyButtonTheme {
  static final lightButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        backgroundColor: mainButtonColor,
        foregroundColor: lightColor700,
        fixedSize: const Size(buttonWidth, buttonHeight),
        shape: const RoundedRectangleBorder(
            borderRadius:
            BorderRadius.all(Radius.circular(10.0))))
  );
}