import 'package:after_school_app/util/colors.dart';
import 'package:flutter/material.dart';

class AppTheme{
  static ThemeData appThemeData = ThemeData(
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
        color: AppColors.primaryText,
      )
    ),
  );


}