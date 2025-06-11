part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

final class SetProfileEvent extends ProfileEvent {
  final String firstName;
  final String lastName;
  final Image profileImage;
  const SetProfileEvent({required this.firstName, required this.lastName, required this.profileImage});

  @override
  List<Object> get props => [super.props, firstName, lastName, profileImage];
}

final class UpdateProfileEvent extends ProfileEvent {
  final String? firstName;
  final String? lastName;
  final Image? profileImage;
  const UpdateProfileEvent({this.firstName, this.lastName, this.profileImage});

  @override
  List<Object> get props => [super.props, firstName ?? '', lastName ?? '', profileImage ?? ''];
}
