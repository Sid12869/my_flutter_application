import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_flutter_application/data/models/video.dart';

class VideoHelper {
  final String path = 'www.googleapis.com';
  final String key = 'AIzaSyDTfM_rf7UZHy1k3Kja1jyF7ZG_TkT4d5E';

  Future<SearchVideoList> getYoutube(String anime) async {
    Map<String, String> queryParams = {
      "key": key,
      "q": "$anime + trailer",
      "type": "video"
    };

    final response =
        await http.get(Uri.https(path, '/youtube/v3/search', queryParams));

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      return SearchVideoList.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load youtube videos');
    }
  }
}
