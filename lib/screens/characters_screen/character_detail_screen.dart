import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:harry_potter_app/core/constants/app_colors.dart';
import 'package:harry_potter_app/core/utils/size_config.dart';
import 'package:harry_potter_app/models/character.dart';
import 'package:harry_potter_app/widgets/custom_app_bar.dart';

class CharacterDetailScreen extends StatelessWidget {
  final Character character;
  const CharacterDetailScreen({super.key, required this.character});

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
        return Colors.grey.shade400;
    }
  }

  IconData _getLifeIcon(bool? alive) {
    if (alive == null) return Icons.help_outline;
    return alive ? Icons.flash_on : Icons.nightlight_round;
  }

  @override
  Widget build(BuildContext context) {
    final cardPadding = SizeConfig.blockWidth * 4;
    final themeColor = _getHouseColor(character.house);

    return Scaffold(
      backgroundColor: AppColors.cardBackgroundDark,
      appBar: CustomAppBar(title: "${character.name}"),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: cardPadding,
          vertical: SizeConfig.blockHeight * 2,
        ),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                themeColor.withValues(alpha: 0.9),
                AppColors.cardBackgroundDark.withValues(alpha: 0.7),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(SizeConfig.blockWidth * 5),
            boxShadow: [
              BoxShadow(
                color: themeColor.withValues(alpha: 0.4),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            children: [
              const SizedBox(height: 24),
              CircleAvatar(
                radius: SizeConfig.blockWidth * 20,
                backgroundColor: AppColors.cardBackgroundLight.withValues(
                  alpha: 0.2,
                ),
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: character.image ?? "",
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        Image.asset("assets/images/placeholder.png"),
                    fit: BoxFit.scaleDown,
                    width: SizeConfig.blockWidth * 38,
                    height: SizeConfig.blockWidth * 38,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              Text(
                character.name ?? "Unknown",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  letterSpacing: 1.2,
                  fontSize: SizeConfig.blockWidth * 6,
                ),
              ),

              Text(
                character.house ?? "No House",
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: AppColors.primaryColorDark,
                  fontSize: SizeConfig.blockWidth * 4,
                ),
              ),

              const SizedBox(height: 16),
              Divider(
                color: Colors.white24,
                thickness: 1,
                indent: 40,
                endIndent: 40,
              ),
              const SizedBox(height: 8),

              _buildInfoRow(Icons.person, "Actor", character.actor, context),
              _buildInfoRow(Icons.pets, "Species", character.species, context),
              _buildInfoRow(Icons.male, "Gender", character.gender, context),
              _buildInfoRow(
                Icons.cake,
                "Year of Birth",
                character.yearOfBirth?.toString(),
                context,
              ),
              _buildInfoRow(
                Icons.remove_red_eye,
                "Eye Color",
                character.eyeColour,
                context,
              ),
              _buildInfoRow(
                Icons.face,
                "Hair Color",
                character.hairColour,
                context,
              ),
              _buildInfoRow(
                _getLifeIcon(character.alive),
                "Alive",
                character.alive == null
                    ? "Unknown"
                    : (character.alive! ? "Yes" : "No"),
                context,
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(
    IconData icon,
    String label,
    String? value,
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16),
      child: Row(
        children: [
          Icon(icon, color: AppColors.textSecondaryDark, size: 26),
          const SizedBox(width: 10),
          Text(
            "$label:",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.cardBackgroundLight,
              fontWeight: FontWeight.bold,
              fontSize: SizeConfig.blockWidth * 4.5,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value ?? "Unknown",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColors.cardBackgroundLight,
                fontWeight: FontWeight.bold,
                fontSize: SizeConfig.blockWidth * 4.5,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
