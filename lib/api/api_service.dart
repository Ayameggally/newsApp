import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp/api/api_constants.dart';
import 'package:newsapp/models/news_response/news_response.dart';
import 'package:newsapp/models/sources_response/sources_response.dart';

class ApiService {
static Future<SourcesResponse> getSources(String categoryId)async{
final uri = Uri.https(
  APIConstants.baseURL,
  APIConstants.sourcesEndpoint,
  {
  'apiKey':APIConstants.apiKey,
  'category':categoryId,
  },
  );
 final response = await http.get(uri);
  final json = jsonDecode (response.body);
  return SourcesResponse.fromJson(json);
}
// static Future<NewsResponse> getNews(
//     {String? sourceId,String? query,int?page,int? pageSize})async{
//   final uri=Uri.https(APIConstants.baseURL,
//       APIConstants.NewsEndpoint,{
//         'apiKey': APIConstants.apiKey,
//         'sources': sourceId,
//         'q':query,
//         'pageSize':pageSize.toString(),
//         'page':page.toString()
//       });
//  final response= await http.get(uri);
// final json=jsonDecode(response.body);
// return NewsResponse.fromJson(json);
// }
 static Future<NewsResponse> getNews({String? sourceId,String ?quary,int? pageSize,int? page})async{
final uri = Uri.https(
  APIConstants.baseURL,
  APIConstants.newsEndpoint,
  {
    'apiKey':APIConstants.apiKey,
    'sources':sourceId,
    'q':quary,
    'pageSize': pageSize.toString(),
    'page': page.toString()
  },
  );
  final response = await http.get(uri);
  final json = jsonDecode(response.body);
  return NewsResponse.fromJson(json);
 }
}
