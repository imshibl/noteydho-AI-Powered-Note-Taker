import 'package:flutter/material.dart';
import 'package:noteydho/utils/consts/colors.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.freshMintGreen,
    scaffoldBackgroundColor: AppColors.softWhite,
    // textTheme: const TextTheme(
    //   bodyText1: TextStyle(color: AppColors.mutedOceanBlue),
    //   bodyText2: TextStyle(color: AppColors.mutedOceanBlue),
    // ),
    appBarTheme: const AppBarTheme(
      color: AppColors.freshMintGreen,
      iconTheme: IconThemeData(color: AppColors.softWhite),
      titleTextStyle: TextStyle(color: AppColors.softWhite),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.lightAquaBlue,
      textTheme: ButtonTextTheme.primary,
    ),
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(secondary: AppColors.coral)
        .copyWith(surface: AppColors.lightGray),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.freshMintGreen,
    scaffoldBackgroundColor: AppColors.softBlack,
    // textTheme: TextTheme(
    //   bodyText1: TextStyle(color: AppColors.softWhite),
    //   bodyText2: TextStyle(color: AppColors.softWhite),
    // ),
    appBarTheme: const AppBarTheme(
      color: AppColors.freshMintGreen,
      iconTheme: IconThemeData(color: AppColors.softWhite),
      titleTextStyle: TextStyle(color: AppColors.softWhite),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.mutedOceanBlue,
      textTheme: ButtonTextTheme.primary,
    ),
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: AppColors.coral).copyWith(
              surface: AppColors.darkGray,
            ),
  );
}
