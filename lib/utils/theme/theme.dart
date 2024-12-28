import 'package:flutter/material.dart';
import 'package:Privado_Vpn/utils/theme/widget_themes/checkbox_theme.dart';
import 'package:Privado_Vpn/utils/theme/widget_themes/chip_theme.dart';
import 'package:Privado_Vpn/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:Privado_Vpn/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:Privado_Vpn/utils/theme/widget_themes/text_theme.dart';

import '../constants/colors.dart';

class SolitaryAppTheme {
  SolitaryAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: TColors.grey,
    brightness: Brightness.light,
    primaryColor: TColors.primary,
    textTheme: TTextTheme.lightTextTheme,
    chipTheme: TChipTheme.lightChipTheme,
    scaffoldBackgroundColor: TColors.white,
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: TColors.grey,
    brightness: Brightness.dark,
    primaryColor: TColors.primary,
    textTheme: TTextTheme.darkTextTheme,
    chipTheme: TChipTheme.darkChipTheme,
    scaffoldBackgroundColor: TColors.black,
    checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
  );
}
