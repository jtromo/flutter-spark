import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spark/bloc/like/like_cubit.dart';
import 'package:flutter_spark/bloc/news/news_bloc.dart';
import 'package:flutter_spark/common/spark_drawer.dart';
import 'package:url_launcher/url_launcher.dart';

// TODO: Add provider, repository and dio - https://pub.dev/packages/dio

class ApiPage extends StatefulWidget {
  const ApiPage({super.key});

  @override
  State<ApiPage> createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  late LikeCubit _likeCubit;
  late NewsBloc _newsBloc;

  @override
  void initState() {
    super.initState();
    _newsBloc = context.read<NewsBloc>();
    _likeCubit = context.read<LikeCubit>();

    _newsBloc.add(GetNewsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("API Page"),
      ),
      drawer: const SparkDrawer(),
      body: BlocListener<LikeCubit, LikeState>(
        listener: (context, state) {
          if (state is LikePressed) {
            const snackBar = SnackBar(content: Text('Liked article'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        child: BlocConsumer<NewsBloc, NewsState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is NewsFailed) {
              return Center(
                child: Text(state.message),
              );
            }

            if (state is! NewsLoaded) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.separated(
                itemBuilder: (content, index) {
                  return Ink(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    child: ListTile(
                      title: Text(state.articles[index].title ?? ""),
                      // subtitle: Text(state.articles[index].description ?? ""),
                      leading: (state.articles[index].urlToImage == null)
                          ? const Icon(Icons.newspaper)
                          : Image.network(state.articles[index].urlToImage!),
                      trailing: IconButton(
                          onPressed: () {
                            _likeCubit.like(state.articles[index]);
                          },
                          icon: const Icon(Icons.thumb_up_rounded)),
                      onTap: () async {
                        if (state.articles[index].url == null) {
                          return;
                        }
                        final Uri url = Uri.parse(state.articles[index].url!);
                        await launchUrl(url);
                      },
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: state.articles.length,
              );
            }
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: "",
            onPressed: () {
              _newsBloc.add(GetNewsEvent());
            },
            tooltip: 'Refresh',
            child: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
