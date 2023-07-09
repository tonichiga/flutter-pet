import 'package:dio/dio.dart';
import 'package:search_repository/src/models/movie_model.dart';

class SearchRepository {
  final apiUrl = 'https://api.jikan.moe/v4/anime';
  final _httpClient = Dio();

  Future<List<MovieModel>> onSearch(String query) async {
    try {
      final res = await _httpClient.get(apiUrl, queryParameters: {
        "q": query,
      });

      final movieList =
          res.data["data"].map((json) => MovieModel.fromJson(json)).toList();

      return movieList;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
