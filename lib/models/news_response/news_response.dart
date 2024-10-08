import 'News.dart';


class NewsResponse {
  final String? status;
  final int? totalResults;
  final List<Articals>? news;

  const NewsResponse({this.status, this.totalResults, this.news});

  factory NewsResponse.fromJson(Map<String, dynamic> json) => NewsResponse(
        status: json['status'] as String?,
        totalResults: json['totalResults'] as int?,
        news: (json['articles'] as List<dynamic>?)
            ?.map((e) => Articals.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  
}
