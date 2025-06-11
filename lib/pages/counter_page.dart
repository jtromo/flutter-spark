import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spark/bloc/counter/counter_cubit.dart';
import 'package:flutter_spark/bloc/counter/counter_state.dart';
import 'package:flutter_spark/common/spark_drawer.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key, this.title = 'Counter Page'});

  final String title;

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  late CounterCubit _counterCubit;
  late int _count;

  @override
  void initState() {
    super.initState();
    _counterCubit = context.read<CounterCubit>();
    _count = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      drawer: const SparkDrawer(),
      body: MultiBlocListener(
        listeners: [
          BlocListener<CounterCubit, CounterState>(
            listener: (context, state) {
              setState(() {
                _count = state.count;
              });
            },
          ),
        ],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Buttons pressed:',
              ),
              Text(
                '$_count',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: "increment",
            onPressed: _counterCubit.increment,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "decrement",
            onPressed: _counterCubit.decrement,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "counter reset",
            onPressed: _counterCubit.reset,
            tooltip: 'Counter Reset',
            child: const Icon(Icons.refresh),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
