import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/ui/providers/counter_provider.dart';
import 'package:widgets_app/ui/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  static const name = "counter_screen";

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int clickCounter = ref.watch(counterProvider);
    //final bool isDarkTheme = ref.watch(darkThemeProvider);
    final bool isDarkTheme = ref.watch(themeNotifierProvider).isDarkTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter screen"),
        actions: [
          IconButton(
              onPressed: () {
                // ref.read(darkThemeProvider.notifier).update((state) => !state);
                ref.read(themeNotifierProvider.notifier).toggleDarkMode();
              },
              icon: Icon(isDarkTheme
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined))
        ],
      ),
      body: Center(
        child: Text("Value: $clickCounter",
            style: Theme.of(context).textTheme.displayLarge),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).state++;
          //ref.read(counterProvider.notifier).update((state) => state + 1);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
