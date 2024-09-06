
import 'source.dart';


class Articals {
  final Source? source;
  final dynamic author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final DateTime? publishedAt;
  final String? content;

  const Articals({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory Articals.fromJson(Map<String, dynamic> json) => Articals(
        source: json['source'] == null
            ? null
            : Source.fromJson(json['source'] as Map<String, dynamic>),
        author: json['author'] as dynamic,
        title: json['title'] as String?,
        description: json['description'] as String?,
        url: json['url'] as String?,
        urlToImage: json['urlToImage'] as String?,
        publishedAt: json['publishedAt'] == null
            ? null
            : DateTime.parse(json['publishedAt'] as String),
        content: json['content'] as String?,
      );

  
}
