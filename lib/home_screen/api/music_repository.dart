import 'dart:convert';

import 'package:musicapi/home_screen/api/music_model.dart';
import 'package:http/http.dart' as http;

class MusicRepostory {

  Future<List<MusicSearch>> getData() async {
    List<MusicSearch>? musicList = [];
    final url = Uri.parse('https://api.deezer.com/search?q=eminem');
    try {
      final res = await http.get(url);
      print(res.statusCode);
      final resData = json.decode(utf8.decode(res.bodyBytes));
      if (res.statusCode == 200) {
        for (final item in resData) {
          musicList.add(MusicSearch.fromJson(item));
        }
      } else {
        print(res.statusCode);
        throw Exception("Server error error code ${res.statusCode}");
      }
    } catch (e) {
      
      throw Exception("Server error $e");
    }
    return musicList;
  }
}
