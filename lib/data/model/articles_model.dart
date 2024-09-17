class ArticlesModel {
  final String status;
  final List<Article> articles;
  ArticlesModel({
    required this.status,
    required this.articles,
  });
  factory ArticlesModel.fromjson(Map<String, dynamic> json) {
    return ArticlesModel(
        status: json['status'],
        articles: (json['articles'] as List)
            .map((e) => Article.fromjson(e))
            .toList());
  }
}

class Article {
  final String title;
  final String name;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  Article({
    required this.name,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
  });
  factory Article.fromjson(Map<String, dynamic> json) {
    return Article(
        name: json['source']['name'],
        title: json['title'],
        description: json['description'],
        url: json['url'],
        urlToImage: json['urlToImage'] ?? '',
        publishedAt: json['publishedAt']);
  }
}
