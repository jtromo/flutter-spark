part of 'like_cubit.dart';

sealed class LikeState extends Equatable {
  const LikeState();

  @override
  List<Object> get props => [];
}

final class LikeInitial extends LikeState {}

final class LikePressed extends LikeState {
  final int articleId;
  const LikePressed({required this.articleId});
}
