import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:anime_palyer/data/models/anime_model.dart';
import 'package:anime_palyer/data/models/character_model.dart';

Future<List<Anime>> fetchTopAnime() async {
  final response = await http.get(Uri.parse("https://api.jikan.moe/v4/top/anime"));

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    final List<dynamic> animeList = data['data'];

    return animeList.map((e) => Anime.fromJson(e)).toList();
  } else {
    throw Exception("Failed to load anime list");
  }
}

Future<List<Character>> fetchCharacters(int count) async {
  List<Character> characters = [];
  int id = 1; // starting ID
  while (characters.length < count) {
    try {
      final response = await http
          .get(Uri.parse('https://api.jikan.moe/v4/characters/$id/full'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        characters.add(Character.fromJson(data));
      } else {
        // id not found, just skip
        print("Skipped ID $id, status: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching ID $id: $e");
    }
    id++; // always increment ID
  }
  return characters;
}
