import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/core/constants.dart';
import 'package:news_app/data/model/Sources_model.dart';
import 'package:news_app/data/model/articles_model.dart';

class ApiManager {
  static Future<List<Source>> fetchSourceList(String categoryId) async {
    var url = Uri.https(
      Constants.domaim,
      'v2/top-headlines/sources',
      {
        'apiKey': Constants.apiKey,
        'category': categoryId,
      },
    );
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      SourcesModel source = SourcesModel.formJson(data);
      return source.sources;
    } else {
      throw Exception('Filed  get Sources');
    }
  }

  static Future<List<Article>> fetchArticleList(String sourceId) async {
    var url = Uri.https(
      Constants.domaim,
      'v2/top-headlines',
      {
        'apiKey': Constants.apiKey,
        'sources': sourceId,
      },
    );
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      ArticlesModel article = ArticlesModel.fromjson(data);
      return article.articles;
    } else {
      throw Exception('Filed  get article');
    }
  }
}
