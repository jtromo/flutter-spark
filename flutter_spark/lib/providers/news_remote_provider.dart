import 'dart:convert';

import "package:http/http.dart" as http;
import 'package:flutter_spark/models/article.dart';

class NewsRemoteProvider {
  NewsRemoteProvider();

  Future<List<Article>> getNews({
    required String search,
    required String apiKey,
  }) async {
    Map<String, String> queryParams = {
      'apiKey': apiKey,
      'q': 'bitcoin',
    };

    Uri url = Uri(
      scheme: 'https',
      host: 'newsapi.org',
      path: 'v2/everything',
      queryParameters: queryParams,
    );

    try {
      final response = await http.get(url);
      if (response.statusCode != 200) {
        throw Exception("Failed to load news");
      }

      if (response.body.isEmpty) {
        throw Exception("Failed to load news");
      }

      final jsonResponse = jsonDecode(response.body);
      if (jsonResponse['status'] != 'ok') {
        throw Exception("Failed to load news");
      }

      List<Article> articlesList = [];
      final articlesJson = jsonResponse['articles'];
      for (final articles in articlesJson) {
        articlesList.add(Article.fromJson(articles));
      }
      // final List<Article> articleList =
      //     articlesJson.map((Map<String, dynamic> jsonObject) => Article.fromJson(jsonObject)).toList(growable: false);

      return articlesList;
    } on Exception catch (e) {
      throw Exception("Exception has occurred: $e");
    }
  }
}

class NetworkHelper {}
