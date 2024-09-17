import 'package:flutter/material.dart';
import 'package:news_app/data/data_sources/network_layer.dart';
import 'package:news_app/data/model/articles_model.dart';

class ArticlesViewModel extends ChangeNotifier {
  List<Article> _articlesList = [];
  List<Article> get articlesList => _articlesList;
  Future<void> getArticleList(String sourceId) async {
    _articlesList = await ApiManager.fetchArticleList(sourceId);
    notifyListeners();
  }
}
