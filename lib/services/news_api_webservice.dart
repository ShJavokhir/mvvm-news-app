import 'package:mvvm_news_app/model/article.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsApiWebService {
  //I dont recommend this way of calling api with apiKey. Because you are exposing your api key.
  String GET_TOP_HEADLINES_URL =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=1786edef761c4550a165511c31e57a2f";
  Future<List<Article>> fetchTopHeadlines() {
    List<Article> articles = [];
    http.get(GET_TOP_HEADLINES_URL).then((value) {
      if (value.statusCode == 200) {
        final decodedBody = json.decode(value.body);
        (decodedBody["articles"] as List).forEach((article) {
          articles.add(Article.fromJson(article));
        });
        return articles;
      } else {
        throw new Exception("Unexpected error");
      }
    }).catchError((onError) {
      throw new Exception(onError);
    });
  }
}
