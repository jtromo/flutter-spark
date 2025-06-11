import 'package:flutter/material.dart';
import 'package:flutter_spark/common/spark_drawer.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({super.key});

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  late bool _switchValue;

  @override
  void initState() {
    super.initState();
    _switchValue = false;
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final brightness = mq.platformBrightness;
    final mqOrientation = mq.orientation;
    final textScaler = mq.textScaler;

    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary, title: const Text("Reactive Page")),
      drawer: const SparkDrawer(),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Center(
            child: Column(
              children: [
                Text("-- Builder data --", style: Theme.of(context).textTheme.headlineLarge),
                LayoutBuilder(
                  builder: (context, constraints) {
                    return Text(constraints.toString());
                  },
                ),
                Text(orientation.toString()),
                OrientationBuilder(
                  builder: (context, orientation) {
                    return Text("Wrong orientation: $orientation");
                  },
                ),
                Text("-- MediaQuery data --", style: Theme.of(context).textTheme.headlineLarge),
                Text("Brightness: $brightness"),
                Text("TextScaler: $textScaler"),
                Text("Orientation: $mqOrientation"),
                Container(height: 30),
                Text("-- Adaptive Widgets --", style: Theme.of(context).textTheme.headlineLarge),
                Switch.adaptive(
                  value: _switchValue,
                  onChanged: (newValue) {
                    setState(() {
                      _switchValue = newValue;
                    });
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
