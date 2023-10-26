import 'dart:convert';

import 'package:http/http.dart';
import 'package:miniproject_f1pulse/models/news_model.dart';

class NewsAPI {
  final endPointUrl =
      "https://gnews.io/api/v4/search?q=formula one&lang=en&apikey=75c3b8c073180a176270a78317f77304";

  Future<List<News>> getArticle() async {
    Response res = await get(Uri.parse(endPointUrl));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      List<News> news =
          body.map((dynamic item) => News.fromJson(item)).toList();

      return news;
    } else {
      throw ("Can't get the news");
    }
  }
}
