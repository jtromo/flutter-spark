import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spark/bloc/animation/animation_cubit.dart';
import 'package:flutter_spark/bloc/animation/animation_state.dart';
import 'package:flutter_spark/common/spark_drawer.dart';
import 'package:flutter_spark/models/animation_data.dart';
import 'package:flutter_spark/utils/constants.dart';

/// **Implicit Animations**
/// These are Flutter widgets that manage animations automatically. You simply set a target value for a property, and
/// the widget animates from its old value to the new one. They offer convenience over control, handling the animation
/// effects for you without requiring explicit animation code.

/// **Explicit Animations**
/// Unlike implicit animations, explicit animations provide greater control and flexibility for complex scenarios.
/// They require you to define the animation's behavior, including using an `AnimationController`, specifying
/// animation curves, and managing the transitions yourself, often with widgets like `AnimatedBuilder`.

/// **Key Differences Between Implicit and Explicit Animations**
/// - **Ease of Use:** Implicit animations are simpler to implement and ideal for straightforward animations, while
///   explicit animations are more complex but offer fine-grained control.
/// - **Control and Flexibility:** Implicit animations offer limited control, suitable for single-property transitions.
///   Explicit animations provide a high degree of control, perfect for multi-property and custom animations.
/// - **Code Complexity:** Implicit animations require minimal code and are easier to maintain. Explicit animations
///   involve more setup and code, giving detailed control over animations.

class AnimationPage extends StatefulWidget {
  const AnimationPage({super.key});

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> with SingleTickerProviderStateMixin {
  static const _duration = Duration(milliseconds: 400);
  late AnimationCubit _animationCubit;
  late AnimationData _animationData;

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _animationCubit = context.read<AnimationCubit>();
    _animationData = _animationCubit.state.animationData;

    _controller = AnimationController(duration: const Duration(seconds: 2), vsync: this);
    _animation = Tween<double>(begin: 0, end: 300).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary, title: const Text("Reactive Page")),
      drawer: const SparkDrawer(),
      body: BlocConsumer<AnimationCubit, AnimationDataState>(
        listener: (context, state) {
          _animationData = state.animationData;
        },
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
            child: ListView(
              children: [
                Text("-- Explicit Animations --", style: Theme.of(context).textTheme.headlineLarge),
                Text("AnimationController", style: Theme.of(context).textTheme.headlineSmall),
                Text("Tween", style: Theme.of(context).textTheme.headlineSmall),
                Text("CurvedAnimation", style: Theme.of(context).textTheme.headlineSmall),
                Text("AnimatedBuilder", style: Theme.of(context).textTheme.headlineSmall),
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Container(width: _animation.value, height: _animation.value, color: Colors.blue);
                  },
                ),
                ElevatedButton(
                  child: const Text('Animate'),
                  onPressed: () {
                    _controller.forward(from: 0);
                  },
                ),
                Text("-- Implicit Animations --", style: Theme.of(context).textTheme.headlineLarge),
                Text("AnimatedOpacity", style: Theme.of(context).textTheme.headlineSmall),
                AnimatedOpacity(
                  duration: const Duration(seconds: 2),
                  opacity: _animationData.opactiy,
                  child: Image.network(owlJpgUrl, width: 100),
                ),
                Text("AnimatedContainer", style: Theme.of(context).textTheme.headlineSmall),
                SizedBox(
                  width: 128,
                  height: 128,
                  child: AnimatedContainer(
                    margin: EdgeInsets.all(_animationData.margin),
                    decoration: BoxDecoration(
                      color: _animationData.color,
                      borderRadius: BorderRadius.circular(_animationData.borderRadius),
                    ),
                    duration: _duration,
                    curve: _animationData.curve,
                  ),
                ),
                Text("AnimatedPositioned", style: Theme.of(context).textTheme.headlineSmall),
                Text("AnimatedAlign", style: Theme.of(context).textTheme.headlineSmall),
                ElevatedButton(
                  child: const Text('Randomize'),
                  onPressed: () {
                    _animationCubit.randomizeAnimationData();
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
