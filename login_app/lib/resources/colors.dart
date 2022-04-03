import 'dart:math';

import 'package:flutter/material.dart';

class ColorPalette {
  static const Color primaryColor = Color.fromARGB(255, 115, 0, 230);
  static MaterialColor primarySwatch = generateMaterialColor(primaryColor);
  static const Color textColorBright = Colors.white;
  static Color textColorBrightDimmed = Colors.white.withOpacity(0.75);
  static const Color scaffoldBgColor = Color.fromARGB(255, 252, 252, 252);

  static MaterialColor generateMaterialColor(Color color) {
    return MaterialColor(color.value, {
      50: tintColor(color, 0.9),
      100: tintColor(color, 0.8),
      200: tintColor(color, 0.6),
      300: tintColor(color, 0.4),
      400: tintColor(color, 0.2),
      500: color,
      600: shadeColor(color, 0.1),
      700: shadeColor(color, 0.2),
      800: shadeColor(color, 0.3),
      900: shadeColor(color, 0.4),
    });
  }

  static int tintValue(int value, double factor) {
    return max(0, min((value + ((255 - value) * factor)).round(), 255));
  }

  static Color tintColor(Color color, double factor) {
    return Color.fromRGBO(tintValue(color.red, factor),
        tintValue(color.green, factor), tintValue(color.blue, factor), 1);
  }

  static int shadeValue(int value, double factor) {
    return max(0, min(value - (value * factor).round(), 255));
  }

  static Color shadeColor(Color color, double factor) {
    return Color.fromRGBO(shadeValue(color.red, factor),
        shadeValue(color.green, factor), shadeValue(color.blue, factor), 1);
  }
}
