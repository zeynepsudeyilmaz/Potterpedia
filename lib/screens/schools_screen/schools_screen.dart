import 'package:flutter/material.dart';
import 'package:harry_potter_app/core/utils/size_config.dart';
import 'package:harry_potter_app/screens/schools_screen/staff_view.dart';
import 'package:harry_potter_app/screens/schools_screen/student_view.dart';
import 'package:harry_potter_app/screens/schools_screen/widgets/school_card.dart';
import 'package:harry_potter_app/widgets/custom_app_bar.dart';

class SchoolsScreen extends StatelessWidget {
  const SchoolsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "School"),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: SizeConfig.blockHeight * 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const StaffView()),
                  );
                },
                child: SchoolCard(title: "STAFF"),
              ),
            ),
            SizedBox(height: SizeConfig.blockHeight * 3),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StudentsView()),
                );
              },
              child: Align(
                alignment: Alignment.centerRight,
                child: SchoolCard(title: "STUDENTS"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
