import 'package:dio/dio.dart';

final apiUrl = 'https://api.jikan.moe/v4/anime';

class SearchRepository {
  final _httpClient = Dio();

  Future<List> onSearch(String query) async {
    try {
      final res = await _httpClient.get(apiUrl, queryParameters: {
        "q": query,
      });
    } catch (e) {
      print(e);
      return [];
    }
  }
}
