import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spark/bloc/animation/animation_cubit.dart';
import 'package:flutter_spark/bloc/counter/counter_cubit.dart';
import 'package:flutter_spark/bloc/like/like_cubit.dart';
import 'package:flutter_spark/bloc/news/news_bloc.dart';
import 'package:flutter_spark/bloc/profile/profile_bloc.dart';
import 'package:flutter_spark/bloc/theme/theme_cubit.dart';
import 'package:flutter_spark/bloc/theme/theme_state.dart';
import 'package:flutter_spark/pages/home_page.dart';
import 'package:flutter_spark/providers/news_local_provider.dart';
import 'package:flutter_spark/providers/news_remote_provider.dart';
import 'package:flutter_spark/repositories/news_repository.dart';

// TODO: Add go_router - https://pub.dev/packages/auto_route

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(create: (context) => AnimationCubit()),
        BlocProvider(create: (context) => CounterCubit()),
        BlocProvider(create: (context) => ProfileBloc()),
        BlocProvider(
          create: (context) => NewsBloc(
            newsRepository: NewsRepository(
              newsRemoteProvider: NewsRemoteProvider(),
              newsLocalProvider: NewsLocalProvider(),
            ),
          ),
        ),
        BlocProvider(create: (context) => LikeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Spark',
            theme: state.theme,
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
