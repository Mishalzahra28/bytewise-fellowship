import 'package:http/http.dart' as http;
// import 'package:convert/convert.dart';
import 'dart:convert';

String _baseURL = 'https://flutter-http-15880-default-rtdb.firebaseio.com/';

class BaseClient {
  Future<dynamic> get(String api) async {
    var url = Uri.parse(_baseURL + api);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      print('Error');
    }
  }

  Future<dynamic> post(String api, dynamic Object) async {
    var url = Uri.parse(_baseURL + api);
    var _data = json.encode(Object);
    var response = await http.put(url, body: _data);
    if (response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      print('Error');
    }
  }

  Future<dynamic> put(String api) async {}

  Future<dynamic> delete(String api) async {}
}
