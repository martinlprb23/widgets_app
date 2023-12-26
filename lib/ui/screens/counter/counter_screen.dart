import 'package:flutter/material.dart';

class CounterScreen extends StatelessWidget {
  static const name = "counter_screen";
  final int counter = 0;

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Counter screen")),
      body: Center(
        child: Text("Value: $counter",
            style: Theme.of(context).textTheme.displayLarge),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
