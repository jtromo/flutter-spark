import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spark/bloc/profile/profile_bloc.dart';
import 'package:flutter_spark/models/profile.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

// TODO: save locally and add form to fill in name

class _ProfilePageState extends State<ProfilePage> {
  late ProfileBloc _profileBloc;

  @override
  void initState() {
    super.initState();

    _profileBloc = context.read<ProfileBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ProfileBloc, ProfileState, Profile?>(
      selector: (state) => (state is ProfileUpdated) ? state.profile : null,
      builder: (context, profile) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            ),
            body: Column(
              children: [
                selectImageButton(context),
                const Divider(),
                (profile != null) ? profile.renderProfileWidget() : Container()
              ],
            ));
      },
    );
  }

  Widget selectImageButton(BuildContext context) {
    return OutlinedButton.icon(
      icon: const Icon(Icons.photo_album),
      onPressed: () async {
        final ImagePicker picker = ImagePicker();
        final XFile? photo = await picker.pickImage(source: ImageSource.gallery);
        if (photo == null) {
          return;
        }
        _profileBloc.add(
          SetProfileEvent(
            firstName: "James",
            lastName: "Romo",
            profileImage: Image.file(File(photo.path)),
          ),
        );

        // setState(() {
        //   _userImage = Image.file(File(photo.path));
        // });
      },
      label: const Text("Select a profile photo"),
    );
  }

  @override
  void dispose() {
    _profileBloc.close();
    super.dispose();
  }
}
