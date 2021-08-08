import 'dart:convert';

import 'package:http/http.dart';

class ApiService {
  final url = Uri.parse('https://meme-api.herokuapp.com/gimme');
  String ImageUrl = "";
  Future<String> getUrl() async {
    print("ApiService");
    Response res = await get(url);
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      ImageUrl = json['url'];
      print("ImageUrl : ${ImageUrl}");
      return ImageUrl;
    } else {
      throw ("Can't get Url");
    }
  }
}
