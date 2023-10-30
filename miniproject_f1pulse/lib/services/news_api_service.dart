import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:miniproject_f1pulse/models/news_model.dart';

class NewsApiService {
  static const String _baseUrl = 'https://newsapi.org/v2';
  static const String _apiKey = '0f80e70653f14c1b840bfd0170dd8d09';

  Future<List<NewsModel>> fetchNews(String query) async {
    final response = await http.get(Uri.parse(
        '$_baseUrl/everything?q=$query&language=en&pageSize=20&apiKey=$_apiKey'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = jsonDecode(response.body);

      if (jsonData.containsKey('articles')) {
        final List<dynamic> articles = jsonData['articles'];
        return articles.map((article) => NewsModel.fromJson(article)).toList();
      } else {
        throw Exception('Failed to load news');
      }
    } else {
      throw Exception('Failed to load news');
    }
  }
}
