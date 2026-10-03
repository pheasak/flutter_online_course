import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learning/fetchAPI/character_model.dart';

class DataSource {
  final String baseUrl = "https://api.api-onepiece.com/v2";

  Future<List<CharacterModel>> getCharacters() async {
    final response = await http.get(Uri.parse('$baseUrl/characters/en'));
    if (response.statusCode == 200) {
      List<dynamic> characters = json.decode(response.body);
      return characters.map((json) => CharacterModel.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load characters");
    }
  }
}
