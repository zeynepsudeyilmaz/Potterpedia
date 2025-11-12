import 'dart:convert';

import 'package:harry_potter_app/core/constants/api_constants.dart';
import 'package:harry_potter_app/models/character.dart';
import 'package:http/http.dart' as http;

class CharacterService {
  Future<List<Character>> getCharacters() async {
    try {
      final response = await http.get(Uri.parse(baseUrl + charactersEndPoint));
      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        final List<Character> characters = jsonList
            .map((toElement) => Character.fromJson(toElement))
            .toList();
        return characters;
      } else {
        throw Exception("Failed to load characters: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error fetching characters");
    }
  }

  Future<List<Character>> getSchools(String school) async {
    try {
      final response = await http.get(
        Uri.parse(baseUrl + charactersEndPoint + school),
      );
      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        final List<Character> characters = jsonList
            .map((toElement) => Character.fromJson(toElement))
            .toList();
        return characters;
      } else {
        throw Exception("Failed to load characters: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error fetching characters");
    }
  }

  Future<List<Character>> getHouses(String house) async {
    try {
      final response = await http.get(
        Uri.parse(baseUrl + charactersEndPoint + housesEndPoint + house),
      );
      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        final List<Character> characters = jsonList
            .map((toElement) => Character.fromJson(toElement))
            .toList();
        return characters;
      } else {
        throw Exception("Failed to load characters: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error fetching characters");
    }
  }
}
