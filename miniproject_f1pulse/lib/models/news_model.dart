class Source {
  String? name;
  String? url;

  Source({this.url, this.name});

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      name: json['name'],
      url: json['url'],
    );
  }
}

class News {
  String? title;
  String? description;
  String? content;
  String? url;
  String? image;
  DateTime? publishedAt;
  Source? source;

  News({
    this.title,
    this.description,
    this.content,
    this.url,
    this.image,
    this.publishedAt,
    this.source,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json['title'] as String,
      description: json['description'] as String,
      content: json['content'] as String,
      url: json['url'] as String,
      image: json['image'] as String,
      publishedAt:
          DateTime.parse(json['publishedAt']), // parse string to DateTime
      source: Source.fromJson(json['source']),
    );
  }
}
