import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spark/models/profile.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<SetProfileEvent>((event, emit) {
      final profile = Profile(
        firstName: event.firstName,
        lastName: event.lastName,
        profileImage: event.profileImage,
      );
      emit(ProfileUpdated(profile: profile));
    });

    on<UpdateProfileEvent>((event, emit) {
      if (state is ProfileUpdated) {
        final profile = Profile(
          firstName: event.firstName ?? (state as ProfileUpdated).profile.firstName,
          lastName: event.lastName ?? (state as ProfileUpdated).profile.lastName,
          profileImage: event.profileImage ?? (state as ProfileUpdated).profile.profileImage,
        );
        emit(ProfileUpdated(profile: profile));
        return;
      }
      if (kDebugMode) {
        print("Failed to update profile. Profile not found");
      }
    });
  }
}
