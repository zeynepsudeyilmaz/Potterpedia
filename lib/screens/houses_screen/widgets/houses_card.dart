import 'package:flutter/material.dart';
import 'package:harry_potter_app/core/constants/app_colors.dart';
import 'package:harry_potter_app/core/utils/size_config.dart';

class HousesCard extends StatelessWidget {
  final String title;
  final String imagePath;
  const HousesCard({super.key, required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    final cardPadding = SizeConfig.blockWidth * 4;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: cardPadding),
      child: Container(
        height: SizeConfig.blockHeight * 30,
        width: SizeConfig.blockWidth * 40,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primaryColorLight.withValues(alpha: 0.9),
              AppColors.cardBackgroundDark.withValues(alpha: 0.7),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(SizeConfig.blockWidth * 5),
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryColorLight.withValues(alpha: 0.4),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockWidth * 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipOval(
                child: Image.asset(
                  imagePath,
                  width: SizeConfig.blockWidth * 30,
                  height: SizeConfig.blockWidth * 30,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: SizeConfig.blockHeight * 2),
              Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
