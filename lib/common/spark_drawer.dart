import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spark/bloc/profile/profile_bloc.dart';
import 'package:flutter_spark/pages/animation_page.dart';
import 'package:flutter_spark/pages/api_page.dart';
import 'package:flutter_spark/pages/counter_page.dart';
import 'package:flutter_spark/pages/grid_page.dart';
import 'package:flutter_spark/pages/home_page.dart';
import 'package:flutter_spark/pages/image_picker_page.dart';
import 'package:flutter_spark/pages/profile_page.dart';
import 'package:flutter_spark/pages/reactive_page.dart';
import 'package:flutter_spark/pages/theme_page.dart';

class SparkDrawer extends StatelessWidget {
  const SparkDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return Drawer(
          child: ListView(
            physics: const ClampingScrollPhysics(),
            padding: EdgeInsets.zero,
            children: [
              Material(
                color: Theme.of(context).colorScheme.primary,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProfilePage()));
                  },
                  child: DrawerHeader(
                    // decoration: BoxDecoration(color: Colors.blue),
                    child: (state is ProfileUpdated)
                        ? Column(
                            children: [
                              CircleAvatar(foregroundImage: state.profile.profileImage.image, radius: 50),
                              Text("${state.profile.firstName} ${state.profile.lastName}"),
                            ],
                          )
                        : const CircleAvatar(minRadius: 20, maxRadius: 50, child: Icon(Icons.person)),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomePage()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.calculate),
                title: const Text('Counter'),
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const CounterPage()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.color_lens),
                title: const Text('Theme'),
                onTap: () {
                  // close drawer
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const ThemePage()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text('Image Picker'),
                onTap: () {
                  Navigator.of(
                    context,
                  ).pushReplacement(MaterialPageRoute(builder: (context) => const ImagePickerPage()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.grid_3x3),
                title: const Text('Grid'),
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const GridPage()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.published_with_changes_rounded),
                title: const Text('Reactive'),
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const ReactivePage()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.catching_pokemon_sharp),
                title: const Text('API'),
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const ApiPage()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.animation),
                title: const Text('Animations'),
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const AnimationPage()));
                },
              ),
              Divider(color: Theme.of(context).colorScheme.inversePrimary),
              ListTile(
                leading: const Icon(Icons.exit_to_app),
                title: const Text('Exit'),
                onTap: () {
                  // close drawer
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
