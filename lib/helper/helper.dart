import 'dart:convert';

import 'package:exam_api/model/news_model.dart';
import 'package:http/http.dart' as http;

class NewsHelper {
  NewsHelper._();

  static final NewsHelper newsHelper = NewsHelper._();

  Future<List<NewsModel>?> fetchNewsData() async {
    // Replace with your actual API URL
    Uri url = Uri.parse(
        "https://newsapi.org/v2/everything?q=business&apiKey=33db21d71e5b4c4e9eacc933b6998679");

    http.Response res = await http.get(url);

    if (res.statusCode == 200) {
      Map<String, dynamic> apiData = jsonDecode(res.body);

      List allNews = apiData['articles'];

      List<NewsModel> allNewsList = allNews
          .map((e) => NewsModel.fromJson(json: e))
          .cast<NewsModel>()
          .toList();

      return allNewsList;
    } else {
      return null;
    }
  }
}
