import 'package:flutter/material.dart';
import 'package:harry_potter_app/core/constants/api_constants.dart';
import 'package:harry_potter_app/models/character.dart';
import 'package:harry_potter_app/screens/characters_screen/character_detail_screen.dart';
import 'package:harry_potter_app/widgets/character_card.dart';
import 'package:harry_potter_app/services/character_service.dart';
import 'package:harry_potter_app/widgets/custom_app_bar.dart';
import 'package:harry_potter_app/widgets/custom_search_bar.dart';

class StudentsView extends StatefulWidget {
  const StudentsView({super.key});

  @override
  State<StudentsView> createState() => _StudentsViewState();
}

class _StudentsViewState extends State<StudentsView> {
  List<Character> _allCharacters = [];
  List<Character> _filteredCharacters = [];
  bool _isLoading = true;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _loadCharacters();
  }

  void _loadCharacters() async {
    try {
      final characters = await CharacterService().getSchools(studentsEndPoint);
      setState(() {
        _allCharacters = characters;
        _filteredCharacters = characters;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _hasError = true;
        _isLoading = false;
      });
    }
  }

  void _filterCharacters(String query) {
    setState(() {
      _filteredCharacters = _allCharacters
          .where(
            (character) =>
                character.name!.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Students"),
      body: Column(
        children: [
          CustomSearchBar(hintText: "Search", onSearch: _filterCharacters),
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _hasError
                ? const Center(child: Text("Error loading characters"))
                : _filteredCharacters.isEmpty
                ? const Center(child: Text("No character found"))
                : ListView.builder(
                    itemCount: _filteredCharacters.length,
                    itemBuilder: (context, index) {
                      final character = _filteredCharacters[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CharacterDetailScreen(character: character),
                            ),
                          );
                        },
                        child: CharacterCard(character: character),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
