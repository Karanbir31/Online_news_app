class NewsSource {
  String? id;
  String name;

  NewsSource({this.id, required this.name});

  factory NewsSource.fromJson(Map<String, dynamic> json) {
    return NewsSource(id: json['id'], name: json['name'] ?? "");
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "name": name};
  }
}

class NewsArticle {
  NewsSource source;
  String? author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  NewsArticle({
    required this.source,
    this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      source: NewsSource.fromJson(json['source']),
      author: json['author'],
      title: json['title'] ?? "",
      description: json['description'] ?? "",
      url: json['url'] ?? "",
      urlToImage: json['urlToImage'] ?? "",
      publishedAt: json['publishedAt'] ?? "",
      content: json['content'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "source": source.toJson(),
      "author": author,
      "title": title,
      "description": description,
      "url": url,
      "urlToImage": urlToImage,
      "publishedAt": publishedAt,
      "content": content,
    };
  }
}

class NewsApiResponse {
  String status;
  int totalResults;
  List<NewsArticle> articles;

  NewsApiResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory NewsApiResponse.fromJson(Map<String, dynamic> json) {
    return NewsApiResponse(
      status: json['status'] ?? "",
      totalResults: json['totalResults'] ?? 0,
      articles: (json['articles'] as List<dynamic>)
          .map((e) => NewsArticle.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "status": status,
      "totalResults": totalResults,
      "articles": articles.map((a) => a.toJson()).toList(),
    };
  }
}
