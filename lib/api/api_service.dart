import 'package:http/http.dart' as http;
import 'package:newsapp/api/api_constants.dart';

class ApiService {
static Future getSources(String categoryId)async{
final uri = Uri.https(APIConstants.baseURL,APIConstants.sourcesEndpoint,{
  'apiKey':APIConstants.apiKey,
  'category':categoryId,
  },
  );
  final response = await http.get(uri);
  response.body
}

}