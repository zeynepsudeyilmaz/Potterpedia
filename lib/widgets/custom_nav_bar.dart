import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  const CustomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentIndex,
      onDestinationSelected: onTap,
      destinations: [
        NavigationDestination(
          icon: FaIcon(FontAwesomeIcons.broomBall),
          label: "Schools",
        ),
        NavigationDestination(
          icon: FaIcon(FontAwesomeIcons.hatWizard),
          label: "Houses",
        ),
        NavigationDestination(
          icon: FaIcon(FontAwesomeIcons.users),
          label: "Characters",
        ),
        NavigationDestination(
          icon: FaIcon(FontAwesomeIcons.wandMagicSparkles),
          label: "Spells",
        ),
      ],
    );
  }
}
