import 'package:flutter/material.dart';
import 'package:harry_potter_app/models/spells.dart';
import 'package:harry_potter_app/screens/spells_screen/widgets/spell_card.dart';
import 'package:harry_potter_app/services/spell_service.dart';
import 'package:harry_potter_app/widgets/custom_app_bar.dart';

class SpellsScreen extends StatefulWidget {
  const SpellsScreen({super.key});

  @override
  State<SpellsScreen> createState() => _SpellsScreenState();
}

class _SpellsScreenState extends State<SpellsScreen> {
  late Future<List<Spell>> _spells;

  @override
  void initState() {
    super.initState();
    _spells = SpellService().getSpells();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Büyüler"),
      body: FutureBuilder<List<Spell>>(
        future: _spells,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error"));
          } else if (snapshot.hasData) {
            final spellList = snapshot.data!;
            return ListView.builder(
              itemCount: spellList.length,
              itemBuilder: (context, index) {
                final spell = spellList[index];
                return SpellCard(spell: spell);
              },
            );
          } else {
            return const Center(child: Text("No data"));
          }
        },
      ),
    );
  }
}
