part of 'news_bloc.dart';

@immutable
sealed class NewsState {}

final class NewsInitial extends NewsState {}

final class NewsLoading extends NewsState {}

final class NewsLoaded extends NewsState {
  final List<Article> articles;
  NewsLoaded({required this.articles});
}

final class NewsFailed extends NewsState {
  final String message;
  NewsFailed({required this.message});
}
