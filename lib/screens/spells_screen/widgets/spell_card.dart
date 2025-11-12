import 'package:flutter/material.dart';
import 'package:harry_potter_app/core/constants/app_colors.dart';
import 'package:harry_potter_app/core/theme/theme_provider.dart';
import 'package:harry_potter_app/core/utils/size_config.dart';
import 'package:harry_potter_app/models/spells.dart';
import 'package:provider/provider.dart';

class SpellCard extends StatelessWidget {
  final Spell spell;
  const SpellCard({super.key, required this.spell});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return Card(
          color: themeProvider.isDark
              ? AppColors.cardBackgroundLight
              : AppColors.cardBackgroundDark,
          margin: EdgeInsets.symmetric(
            vertical: SizeConfig.blockHeight * 1,
            horizontal: SizeConfig.blockWidth * 4,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 4,
          child: Padding(
            padding: EdgeInsets.all(SizeConfig.blockWidth * 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  spell.name ?? "",
                  style: themeProvider.isDark
                      ? Theme.of(context).textTheme.titleLarge?.copyWith(
                          letterSpacing: 1.2,
                          fontSize: SizeConfig.blockWidth * 6,
                          color: AppColors.textPrimaryLight,
                        )
                      : Theme.of(context).textTheme.titleLarge?.copyWith(
                          letterSpacing: 1.2,
                          fontSize: SizeConfig.blockWidth * 6,
                        ),
                ),
                SizedBox(height: SizeConfig.blockHeight * 1),
                Text(
                  spell.description,
                  style: themeProvider.isDark
                      ? Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: AppColors.primaryColorLight,
                          fontSize: SizeConfig.blockWidth * 4,
                        )
                      : Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: AppColors.primaryColorDark,
                          fontSize: SizeConfig.blockWidth * 4,
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
