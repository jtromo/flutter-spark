import 'package:flutter/material.dart';
import 'package:flutter_spark/common/spark_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, this.title = 'Flutter Spark'});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      drawer: const SparkDrawer(),
      body: const Center(
        child: Text(
          "Welcome to Flutter Spark!",
        ),
      ),
    );
  }
}
