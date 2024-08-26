class SourcesModel {
  final String status;
  final List<Source> sources;
  SourcesModel({
    required this.status,
    required this.sources,
  });
  factory SourcesModel.formJson(Map<String, dynamic> json) => SourcesModel(
        status: json['status'],
        sources: (json['sources'] as List)
            .map(
              (element) => Source.fromjson(element),
            )
            .toList(),
      );
}

class Source {
  String id;
  String name;
  Source({
    required this.id,
    required this.name,
  });
  factory Source.fromjson(Map<String, dynamic> json) {
    return Source(id: json['id'], name: json['name']);
  }
}
  /*  {
             "id": "bbc-sport",
            "name": "BBC Sport",
           "description": "The home of BBC Sport online. Includes live sports coverage, breaking news, results, video, audio and analysis on Football, F1, Cricket, Rugby Union, Rugby League, Golf, Tennis and all the main world sports, plus major events such as the Olympic Games.",
           "url": "http://www.bbc.co.uk/sport",
            "category": "sports",
            "language": "en",
          "country": "gb"
        },
        */