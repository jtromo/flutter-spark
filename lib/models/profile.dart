import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  final String firstName;
  final String lastName;
  final Image profileImage;

  const Profile({required this.firstName, required this.lastName, required this.profileImage});

  Widget renderProfileWidget() {
    return Column(
      children: [
        Text("$firstName $lastName"),
        const Divider(),
        profileImage,
      ],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'profileImage': profileImage,
    };
  }

  @override
  String toString() => 'Profile(firstName: $firstName, lastName: $lastName, profileImage: $profileImage)';

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      firstName: json['firstName'],
      lastName: json['lastName'],
      profileImage: Image.asset(json['profileImage']),
    );
  }

  Profile copyWith({
    String? firstName,
    String? lastName,
    Image? profileImage,
  }) {
    return Profile(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      profileImage: profileImage ?? this.profileImage,
    );
  }

  @override
  List<Object?> get props => [firstName, lastName, profileImage];
}
