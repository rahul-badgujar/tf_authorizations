import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class Themes {
  static ThemeData get primaryLightTheme {
    return ThemeData(
      primarySwatch: ColorPalette.primarySwatch,
      primaryColor: ColorPalette.primaryColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: ColorPalette.scaffoldBgColor,
      // TODO: you can change your text theme here.
      textTheme: GoogleFonts.ubuntuTextTheme(),
      appBarTheme: defaultAppBarTheme,
    );
  }

  static AppBarTheme get defaultAppBarTheme {
    return const AppBarTheme(
      elevation: 0,
    );
  }
}
