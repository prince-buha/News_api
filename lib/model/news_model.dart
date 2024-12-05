import 'dart:convert';

List<NewsModel> newsModelFromJson(String str) => List<NewsModel>.from(
    json.decode(str).map((x) => NewsModel.fromJson(json: {})));

String newsModelToJson(List<NewsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewsModel {
  Source source;
  String? author;
  String title;
  String? description;
  String url;
  String? urlToImage;
  DateTime publishedAt;
  String content;

  NewsModel({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory NewsModel.fromJson({required Map<String, dynamic> json}) => NewsModel(
        source: Source.fromJson(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content,
      };
}

class Source {
  Id? id;
  String name;

  Source({
    required this.id,
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: idValues.map[json["id"]],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": idValues.reverse[id],
        "name": name,
      };
}

enum Id { ABC_NEWS, BUSINESS_INSIDER, THE_VERGE, TIME, WIRED }

final idValues = EnumValues({
  "abc-news": Id.ABC_NEWS,
  "business-insider": Id.BUSINESS_INSIDER,
  "the-verge": Id.THE_VERGE,
  "time": Id.TIME,
  "wired": Id.WIRED
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
