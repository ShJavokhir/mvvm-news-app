import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_news_app/model/article.dart';
import 'package:mvvm_news_app/services/news_api_webservice.dart';

class TopHeadlinesViewModel with ChangeNotifier {
  List<Article> articles = [];
  void fetchTopHeadlines(BuildContext context) async {
    try {
      articles = await NewsApiWebService().fetchTopHeadlines();
      notifyListeners();
    } catch (e) {
      print(e);
      //TODO: show dialog about error
    }
  }

  void openArticleDetailPage({BuildContext context, Article articleToShow}) {
    Navigator.of(context).pushNamed("/articleDetail", arguments: articleToShow);
  }
}
