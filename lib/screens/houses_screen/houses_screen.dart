import 'package:flutter/material.dart';
import 'package:harry_potter_app/core/utils/size_config.dart';
import 'package:harry_potter_app/screens/houses_screen/gryffindor.dart';
import 'package:harry_potter_app/screens/houses_screen/hufflepuff.dart';
import 'package:harry_potter_app/screens/houses_screen/ravenclaw.dart';
import 'package:harry_potter_app/screens/houses_screen/slytherin.dart';
import 'package:harry_potter_app/screens/houses_screen/widgets/houses_card.dart';
import 'package:harry_potter_app/widgets/custom_app_bar.dart';

class HousesScreen extends StatelessWidget {
  const HousesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Evler"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Gryffindor()),
                  );
                },
                child: HousesCard(
                  title: "Griffyindor",
                  imagePath: "assets/images/gryffindor.png",
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Hufflepuff()),
                  );
                },
                child: HousesCard(
                  title: "Hufflepuff",
                  imagePath: "assets/images/hufflepuff.png",
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.blockHeight * 4),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Ravenclaw()),
                  );
                },
                child: HousesCard(
                  title: "Ravenclaw",
                  imagePath: "assets/images/ravenclaw.png",
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Slytherin()),
                  );
                },
                child: HousesCard(
                  title: "Slytherin",
                  imagePath: "assets/images/slytherin.png",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
