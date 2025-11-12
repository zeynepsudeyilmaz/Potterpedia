import 'dart:convert';

import 'package:harry_potter_app/core/constants/api_constants.dart';
import 'package:harry_potter_app/models/spells.dart';
import 'package:http/http.dart' as http;

class SpellService {
  Future<List<Spell>> getSpells() async {
    try {
      final response = await http.get(Uri.parse(baseUrl + spellsEndPoint));
      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        final List<Spell> spells = jsonList
            .map((toElement) => Spell.fromJson(toElement))
            .toList();
        return spells;
      } else {
        throw Exception("Failed to load characters: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error fetching characters");
    }
  }
}
