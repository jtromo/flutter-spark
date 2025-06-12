import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spark/bloc/animation/animation_state.dart';
import 'package:flutter_spark/models/animation_data.dart';

class AnimationCubit extends Cubit<AnimationDataState> {
  AnimationCubit() : super(AnimationDataInitial());

  void changeAnimationData(AnimationData animationData) =>
      emit(AnimationDataStateUpdated(animationData: animationData));
  void randomizeAnimationData() => emit(AnimationDataStateUpdated(animationData: AnimationData.random()));
  void reset() => emit(AnimationDataInitial());
}
