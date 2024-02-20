import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:timnews/models/article_model.dart';
import 'package:http/http.dart' as http;
//import 'package:timnews/secret.dart';

class News {
  List<ArticleModel> news = [];
  var apiKey = "2ef8c82705964063b37a712f35d2e10f";

  Future<void> getNews() async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=us&excludeDomains=stackoverflow.com&sortBy=popularity&language=en&apiKey=$apiKey";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      debugPrint("ok");
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null &&
            element['description'] != null &&
            element['author'] != null &&
            element['title'] != null &&
            element['content'] != null &&
            element['url'] != null) {
          ArticleModel article = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            content: element["content"],
            articleUrl: element["url"],
          );
          news.add(article);
        }
      });
    } else {
      for (int i = 0; i < 10; i++) {
        ArticleModel article = ArticleModel(
          title: "Test title",
          author: "Test author",
          description: "Test description blablabla",
          urlToImage: "https://i.stack.imgur.com/tv4j2.png",
          content: "Test content",
          articleUrl: "https://i.stack.imgur.com/tv4j2.png",
        );
        news.add(article);
      }
    }
  }
}

class NewsForCategory {
  List<ArticleModel> news = [];
  var apiKey = "2ef8c82705964063b37a712f35d2e10f";

  Future<void> getNewsForCategory(String category) async {
    /*String url = "http://newsapi.org/v2/everything?q=$category&apiKey=${apiKey}";*/
    String url =
        "http://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=$apiKey";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null &&
            element['description'] != null &&
            element['author'] != null &&
            element['title'] != null &&
            element['content'] != null &&
            element['url'] != null) {
          ArticleModel article = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            content: element["content"],
            articleUrl: element["url"],
          );
          news.add(article);
        }
      });
    }
  }
}
