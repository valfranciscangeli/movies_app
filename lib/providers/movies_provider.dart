import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:movies_app/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  final String _apikey = 'f5f4c74cac0a87d200eca1933ab7dcf0';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'es-ES';
  String page = '1';

  List<Movie> ondisplayMovies = [];

  MoviesProvider() {
    getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing',
        {'api_key': _apikey, 'language': _language, 'page': page});

    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);

    print(nowPlayingResponse.results[1].title);
    this.ondisplayMovies = nowPlayingResponse.results;
    notifyListeners();
    print(ondisplayMovies);
  }
}
