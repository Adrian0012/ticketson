import 'package:flutter/material.dart';
import 'package:ticketson/config/themes/fonts.dart';
import 'package:ticketson/config/themes/palette.dart';

class Themes {
  static ThemeData primaryTheme = ThemeData(
    primaryColor: Palette.primaryColor,
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: Palette.accentColor),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: Fonts.openSans,
    brightness: Brightness.light,
  );
}
