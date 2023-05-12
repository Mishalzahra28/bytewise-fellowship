import 'package:http/http.dart' as http;
import 'dart:convert';
import './model.dart';

String _baseURL = 'https://flutter-http-15880-default-rtdb.firebaseio.com/';

class BaseClient {
  List todoList = [];

  Future<dynamic> get(String api) async {
    var url = Uri.parse(_baseURL + api);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      print('succesfull');
      final res = json.decode(response.body) as Map<String, dynamic>;
      res.forEach((id, todoData) {
        todoList.add([todoData["title"], todoData["date"]]);
      });
      print(res);
      print(todoList);
      return todoList;
    } else {
      print('Error');
    }
  }

  Future<dynamic> post(String api, dynamic Object) async {
    var url = Uri.parse(_baseURL + api);
    var _data = json.encode(Object);
    var response = await http.patch(url, body: _data);
  }

  Future<dynamic> put(String api) async {}

  Future<dynamic> delete(String api) async {}
}
