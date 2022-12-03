import 'package:flutter/material.dart';

class Palette {
  // base colors
  static const Color transparent = Colors.transparent;
  static const Color primaryColor = Color(0xffffc976);
  static const Color accentColor = Color(0xffff5778);
  static const Color secondaryColor = Color(0xff57ffde);
  static const Color white = Color(0xfff9f6ee);
  static const Color black = Colors.black26;

  // text colors
  static const Color inputTextColor = Color(0xff007ee1);

  // ticket status
  static const Color ticketPending = Colors.blueGrey;
  static const Color ticketWon = Colors.green;
  static const Color ticketLost = Colors.red;

  // shimmer gradient
  static const Color shimmerColor1 = Color(0xFFEBEBF4);
  static const Color shimmerColor2 = Color(0xFFF4F4F4);
  static const Color shimmerColor3 = Color(0xFFEBEBF4);

  // gradient
  static List<Color> get baseGradient => [
        const Color(0xffffc976),
        const Color(0xffff5778),
      ];

  static List<Color> get loginBackgroundGradient => [
        const Color(0xff57ffde).withOpacity(1),
        const Color(0xffffc976).withOpacity(1),
      ];

  static List<Color> get loginAnimationGradient => [
        const Color(0xffffc976),
        const Color(0xffff5778),
      ];
}
