import 'package:flutter/material.dart';
import 'package:harry_potter_app/core/theme/app_theme.dart';
import 'package:harry_potter_app/core/theme/theme_provider.dart';
import 'package:harry_potter_app/core/utils/size_config.dart';
import 'package:harry_potter_app/screens/characters_screen/characters_screen.dart';
import 'package:harry_potter_app/screens/houses_screen/houses_screen.dart';
import 'package:harry_potter_app/screens/schools_screen/schools_screen.dart';
import 'package:harry_potter_app/screens/spells_screen/spells_screen.dart';
import 'package:harry_potter_app/widgets/custom_nav_bar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyAppRoot());
}

class MyAppRoot extends StatelessWidget {
  const MyAppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return ChangeNotifierProvider(
          create: (_) => ThemeProvider(context),
          child: const MyApp(),
        );
      },
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 2;
  final List<Widget> _pages = [
    SchoolsScreen(),
    HousesScreen(),
    CharactersScreen(),
    SpellsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        SizeConfig.init(context);
        return MaterialApp(
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeProvider.currentTheme,
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: _pages[_selectedIndex],
            bottomNavigationBar: CustomNavBar(
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
            ),
          ),
        );
      },
    );
  }
}
