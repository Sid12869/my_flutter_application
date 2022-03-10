import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/anime.dart';

class AnimeHelper {
  final String path = 'https://ghibliapi.herokuapp.com/films';

  Future<List<Anime>> getAnime() async {
    final response = await http
      .get(Uri.parse(path));

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((e) => Anime.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load album');
  }
  }

}