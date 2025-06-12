import 'package:flutter/material.dart';
import 'package:flutter_spark/models/animation_data.dart';
import 'package:flutter_spark/utils/constants.dart';
import 'package:equatable/equatable.dart';

@immutable
sealed class AnimationDataState extends Equatable {
  late final AnimationData animationData;

  AnimationDataState({AnimationData? animationData}) {
    if (animationData == null) {
      this.animationData = defaultAnimationData;
    } else {
      this.animationData = animationData;
    }
  }

  @override
  List<Object> get props => [animationData.hashCode];
}

final class AnimationDataInitial extends AnimationDataState {
  AnimationDataInitial();
}

final class AnimationDataStateUpdated extends AnimationDataState {
  AnimationDataStateUpdated({required super.animationData});
}
