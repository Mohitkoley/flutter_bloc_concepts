import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/counter_cubit.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key, required this.title, required this.color})
      : super(key: key);

  final String title;
  final Color color;
  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
        backgroundColor: widget.color,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.counterValue == 0) {
                  _showSnack("value can't be negative");
                }
              },
              builder: (context, state) {
                return Text(
                  state.counterValue.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () => BlocProvider.of<CounterCubit>(context).increment(),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () => BlocProvider.of<CounterCubit>(context).decrement(),
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () => BlocProvider.of<CounterCubit>(context).reset(),
            tooltip: 'Reset',
            child: const Icon(Icons.loop_rounded),
          ),
        ],
      ),
    );
  }

  _showSnack(String txt, [Color? color]) {
    SnackBar snackBar = SnackBar(
        content: Text(txt),
        backgroundColor: color ?? const Color.fromARGB(255, 231, 118, 110),
        duration: const Duration(seconds: 2));

    return ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
