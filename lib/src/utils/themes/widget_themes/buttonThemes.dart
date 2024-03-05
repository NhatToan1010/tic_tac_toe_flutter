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
              borderRadius: BorderRadius.all(Radius.circular(10.0)))));
  static final lightIconButtonTheme = IconButtonThemeData(
    style: IconButton.styleFrom(
      backgroundColor: mainButtonColor,
      foregroundColor: lightColor700,
      shape: const CircleBorder(),
      fixedSize: const Size(iconButtonWidth, iconButtonHeight),
    ),
  );
}
