// ignore_for_file: avoid_print

import 'package:http/http.dart ' as http;
import 'dart:convert';

class API {
  static Future<List> getUser() async {
    List data = [];
    http.Response response;
    print("Get User");
    final Map<String, String> header = {"Authorization": "XXXXXXXXXXXXXX"};
    try {
      response = await http.get(Uri.parse("https://api.github.com/users"),
          headers: header);

      if (response.statusCode >= 200 || response.statusCode < 300) {
        data = jsonDecode(response.body);
        print("data: $data");
      }
    } catch (e) {
      print("Api Error $e");
    }
    return data;
  }
}
