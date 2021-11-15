import 'dart:convert';

import 'package:newsify/models/article.dart';
import 'package:http/http.dart' as http;




class News {
  List<ArticleModel> articles = [];
  Future<void> getNews() async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=in&apiKey=558cc50cb07d4a6b9779f5dadd08fb95';
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((article) {
        if (article["urlToImage"] != null && article['description'] != null&& article['content']!=null&& article['author']!=null) {
          ArticleModel newArticles = ArticleModel(
            title: article['title'],
            description: article['description'],
            imageUrl: article['urlToImage'],

            url: article['url'],
              content: article['content'],
            author: article['author'],
            // publishedAt: article['publishedAt'],
          );
          articles.add(newArticles);
        }
      });
    }
  }
}

class CategoryNews {
  List<ArticleModel> articles = [];
  Future<void> getCategoryNews(String category) async {
    String url =
        'https://newsapi.org/v2/top-headlines?category=$category&country=in&apiKey=558cc50cb07d4a6b9779f5dadd08fb95';
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((article) {
        if (article["urlToImage"] != null && article['description'] != null&& article['content']!=null&& article['author']!=null) {
          ArticleModel newArticles = ArticleModel(
            title: article['title'],
            description: article['description'],
            imageUrl: article['urlToImage'],

            url: article['url'],
            content: article['content'],
            author: article['author'],
            // publishedAt: article['publishedAt'],
          );
          articles.add(newArticles);
        }
      });
    }
  }
}