import 'dart:convert';

import 'package:http/http.dart' as http;

class Request {
  Request() {}
  getrequest() async {
    http.Response response =
        await http.get(Uri.parse("https://fakestoreapi.com/products"));
    //print(response.body);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    return [];
  }
}
