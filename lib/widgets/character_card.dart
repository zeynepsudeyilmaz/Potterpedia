import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:harry_potter_app/core/constants/app_colors.dart';
import 'package:harry_potter_app/core/theme/theme_provider.dart';
import 'package:harry_potter_app/core/utils/size_config.dart';
import 'package:harry_potter_app/models/character.dart';
import 'package:provider/provider.dart';

class CharacterCard extends StatelessWidget {
  final Character character;
  const CharacterCard({super.key, required this.character});

  Color _getHouseColor(String? houseName) {
    switch ((houseName ?? '').toLowerCase()) {
      case 'gryffindor':
        return AppColors.gryffindor;
      case 'slytherin':
        return AppColors.slytherin;
      case 'hufflepuff':
        return AppColors.hufflepuff;
      case 'ravenclaw':
        return AppColors.ravenclaw;
      default:
        return Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context) {
    final cardHeight = SizeConfig.blockHeight * 16;
    final cardPadding = SizeConfig.blockWidth * 4;
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: cardPadding,
            vertical: SizeConfig.blockHeight * 1,
          ),
          child: Container(
            width: double.infinity,
            height: cardHeight,
            padding: EdgeInsets.all(cardPadding / 2),
            decoration: BoxDecoration(
              color: themeProvider.isDark
                  ? AppColors.cardBackgroundLight
                  : AppColors.cardBackgroundDark,
              borderRadius: BorderRadius.circular(SizeConfig.blockWidth * 3),
              boxShadow: [
                BoxShadow(
                  color: themeProvider.isDark
                      ? AppColors.cardBackgroundLight
                      : AppColors.cardBackgroundDark,
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                SizedBox(
                  width: cardHeight * 0.8,
                  height: cardHeight * 0.8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      SizeConfig.blockWidth * 4,
                    ),
                    child: CachedNetworkImage(
                      imageUrl: character.image ?? "",
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          Image.asset("assets/images/placeholder.png"),
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),

                SizedBox(width: cardPadding),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        character.name ?? "Unknown",
                        style: themeProvider.isDark
                            ? Theme.of(context).textTheme.titleSmall
                            : Theme.of(context).textTheme.titleSmall?.copyWith(
                                color: AppColors.textPrimaryDark,
                              ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: SizeConfig.blockHeight * 0.5),
                      Text(
                        character.actor ?? "Unknown",
                        style: themeProvider.isDark
                            ? Theme.of(context).textTheme.bodyLarge
                            : Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: AppColors.textPrimaryDark,
                              ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(left: cardPadding / 2),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: _getHouseColor(character.house),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      character.house ?? "Unknown",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.universalTextColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
