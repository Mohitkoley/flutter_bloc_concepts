import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/counter_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blueAccent,
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
            const SizedBox(
              height: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton(
                      onPressed: () =>
                          BlocProvider.of<CounterCubit>(context).increment(),
                      tooltip: 'Increment',
                      child: const Icon(Icons.add),
                    ),
                    FloatingActionButton(
                      onPressed: () =>
                          BlocProvider.of<CounterCubit>(context).decrement(),
                      tooltip: 'Decrement',
                      child: const Icon(Icons.remove),
                    ),
                    FloatingActionButton(
                      onPressed: () =>
                          BlocProvider.of<CounterCubit>(context).reset(),
                      tooltip: 'Reset',
                      child: const Icon(Icons.loop_rounded),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/second");
                  },
                  child: const Text("SecondPage"),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.orange),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/third");
                  },
                  child: const Text("ThirdPagePage"),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green)),
                )
              ],
            ),
          ],
        ),
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
