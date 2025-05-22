class SourceModel {
  String? id;
  String? name;

  SourceModel({required this.name, required this.id});

  ///from Map
  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(name: json['name'], id: json['id']);
  }
}

class ArticlesModel {
  String? author;
  String? content;
  String? description;
  String? publishedAt;
  SourceModel? source;
  String? title;
  String? url;
  String? urlToImage;

  ArticlesModel(
      {required this.title,
      required this.url,
      required this.description,
      required this.author,
      required this.content,
      required this.publishedAt,
      required this.source,
      required this.urlToImage});

  ///from Map
  factory ArticlesModel.fromJson(Map<String, dynamic> json) {
    return ArticlesModel(
        title: json['title'],
        url: json['url'],
        description: json['description'],
        author: json['author'],
        content: json['content'],
        publishedAt: json['publishedAt'],
        source: SourceModel.fromJson(json['source']),
        urlToImage: json['urlToImage']);
  }
}

class DataModelNews {
  String? status;
  int? totalResults;
  List<ArticlesModel>? articles;

  DataModelNews(
      {required this.articles,
      required this.status,
      required this.totalResults});

  ///from Map
  factory DataModelNews.fromJson(Map<String, dynamic> json){
    List<ArticlesModel> mArticles = [];
    for(Map<String, dynamic> eachArticle in json['articles']){
      mArticles.add(ArticlesModel.fromJson(eachArticle));
    }

    return DataModelNews(
        articles: mArticles,
        status: json['status'],
        totalResults: json['totalResults']);
  }
}
