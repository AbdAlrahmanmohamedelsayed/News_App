import 'package:flutter/material.dart';
import 'package:news_app/data/data_sources/network_layer.dart';
import 'package:news_app/data/model/Sources_model.dart';

class SourcesViewModel extends ChangeNotifier {
  List<Source> _sourcesList = [];
  List<Source> get sourcesList => _sourcesList;
  Future<void> getSourcesList(String categoryId) async {
    _sourcesList = await ApiManager.fetchSourceList(categoryId);
    notifyListeners();
  }
}
