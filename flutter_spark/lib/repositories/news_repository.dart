import 'package:flutter_spark/models/article.dart';
import 'package:flutter_spark/providers/news_local_provider.dart';
import 'package:flutter_spark/providers/news_remote_provider.dart';

class NewsRepository {
  final NewsRemoteProvider newsRemoteProvider;
  final NewsLocalProvider newsLocalProvider;

  NewsRepository({required this.newsRemoteProvider, required this.newsLocalProvider});

  Future<List<Article>> getNews() async {
    // local (offline)
    // SQLite DB

    // remote (online)
    return newsRemoteProvider.getNews(search: "news", apiKey: <api-key>);
  }
}
