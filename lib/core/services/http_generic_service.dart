import 'dart:convert';
import 'package:http/http.dart' as http;


class HttpGenericService {
  genericHttGet(String path) async {
    var response = await http.get(
      Uri.parse(path),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if(response.statusCode==200){
      return response;
    }
  }

  generateHttpPost<T>(T entity, String url) async {
    var response = await http.post(
      Uri.parse(url),
      body: (jsonEncode(entity)),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    return response;
  }

  generateHttpPut<T>(T entity, String url) async {
    var response = await http.post(
      Uri.parse(url),
      body: (jsonEncode(entity)),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    return response;
  }
}