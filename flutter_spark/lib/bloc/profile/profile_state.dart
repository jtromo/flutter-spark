part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();
  // final String? firstName;
  // final String? lastName;
  // final Image? image;

  // const ProfileState({this.firstName, this.lastName, this.image});

  // @override
  // List<Object> get props => [firstName ?? "", lastName ?? "", image ?? ""];
  @override
  List<Object?> get props => [];
}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileUpdated extends ProfileState {
  final Profile profile;
  const ProfileUpdated({required this.profile}) : super();

  @override
  List<Object> get props => [profile];
}
