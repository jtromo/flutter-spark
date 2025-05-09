import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spark/models/article.dart';

part 'like_state.dart';

class LikeCubit extends Cubit<LikeState> {
  LikeCubit() : super(LikeInitial());

  void like(Article article) {
    emit(LikePressed(articleId: article.id));

    // adding the articleId a Hive UserPrefences
  }
}
