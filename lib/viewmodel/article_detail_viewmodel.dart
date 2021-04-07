import 'package:flutter/material.dart';
import 'package:mvvm_news_app/model/article.dart';

class ArticleDetailViewModel extends ChangeNotifier {
  Article _article;

  set article(Article article) {
    _article = article;
  }

  get article => _article;
}
