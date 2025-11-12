import 'package:flutter/material.dart';
import 'package:harry_potter_app/core/constants/app_colors.dart';
import 'package:harry_potter_app/core/constants/app_text_styles.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.scaffoldDark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryColorDark,
        brightness: Brightness.dark,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.cardBackgroundDark,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: AppTextStyles.title.copyWith(
          color: AppColors.textPrimaryDark,
        ),
      ),

      textTheme: TextTheme(
        titleLarge: AppTextStyles.title.copyWith(
          color: AppColors.textPrimaryDark,
          fontWeight: FontWeight.bold,
        ),
        titleMedium: AppTextStyles.title.copyWith(
          color: AppColors.textPrimaryLight,
        ),
        titleSmall: AppTextStyles.subtitle.copyWith(
          color: AppColors.textPrimaryLight,
        ),
        bodyLarge: AppTextStyles.body.copyWith(
          color: AppColors.textPrimaryLight,
        ),
        bodyMedium: AppTextStyles.subtitle.copyWith(
          color: AppColors.textSecondaryLight,
        ),
        bodySmall: AppTextStyles.body.copyWith(
          color: AppColors.textPrimaryDark,
        ),
      ),
      cardColor: AppColors.cardBackgroundLight,

      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.scaffoldDark,
        indicatorColor: Colors.transparent,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          return AppTextStyles.body.copyWith(
            color: states.contains(WidgetState.selected)
                ? AppColors.textPrimaryDark
                : AppColors.textSecondaryDark,
          );
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          return IconThemeData(
            color: states.contains(WidgetState.selected)
                ? AppColors.primaryColorDark
                : AppColors.textSecondaryDark,
          );
        }),
      ),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.scaffoldLight,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryColorLight,
        brightness: Brightness.light,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.cardBackgroundLight,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: AppTextStyles.title.copyWith(
          color: AppColors.textPrimaryLight,
        ),
      ),
      textTheme: TextTheme(
        titleLarge: AppTextStyles.title.copyWith(
          color: AppColors.textPrimaryDark,
          fontWeight: FontWeight.bold,
        ),
        titleMedium: AppTextStyles.title.copyWith(
          color: AppColors.textPrimaryLight,
        ),
        titleSmall: AppTextStyles.subtitle.copyWith(
          color: AppColors.textPrimaryLight,
        ),
        bodyLarge: AppTextStyles.body.copyWith(
          color: AppColors.textPrimaryLight,
        ),
        bodyMedium: AppTextStyles.subtitle.copyWith(
          color: AppColors.textSecondaryLight,
        ),
        bodySmall: AppTextStyles.body.copyWith(
          color: AppColors.textPrimaryDark,
        ),
      ),
      cardColor: AppColors.cardBackgroundLight,
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.scaffoldLight,
        indicatorColor: Colors.transparent,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          return AppTextStyles.body.copyWith(
            color: states.contains(WidgetState.selected)
                ? AppColors.textPrimaryLight
                : AppColors.textSecondaryLight,
          );
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          return IconThemeData(
            color: states.contains(WidgetState.selected)
                ? AppColors.primaryColorLight
                : AppColors.textSecondaryLight,
          );
        }),
      ),
    );
  }
}
