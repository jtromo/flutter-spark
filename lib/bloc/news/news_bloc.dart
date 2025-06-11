import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spark/models/article.dart';
import 'package:flutter_spark/repositories/news_repository.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository newsRepository;

  NewsBloc({required this.newsRepository}) : super(NewsInitial()) {
    on<GetNewsEvent>((event, emit) async {
      emit(NewsLoading());
      try {
        final articles = await newsRepository.getNews();
        emit(NewsLoaded(articles: articles));
      } catch (e) {
        emit(NewsFailed(message: e.toString()));
      }
    });
  }
}
