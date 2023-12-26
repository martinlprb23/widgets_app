import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const name = "theme_changer_screen";

  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final bool isDarkTheme = ref.watch(darkThemeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme changer"),
        actions: [
          IconButton(
              onPressed: () {
                ref.read(darkThemeProvider.notifier).update((state) => !state);
              },
              icon: Icon(isDarkTheme
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined))
        ],
      ),
      body: const _ThemeChargerView(),
    );
  }
}

class _ThemeChargerView extends ConsumerWidget {
  const _ThemeChargerView();

  @override
  Widget build(BuildContext context, ref) {
    final List<Color> colors = ref.watch(colorListProvider);
    final int selectedIndex = ref.watch(selectedColorProvider);
    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final color = colors[index];
        return RadioListTile(
          title: Text(
            "This color",
            style: TextStyle(color: color),
          ),
          subtitle: Text("${color.value}"),
          activeColor: color,
          value: index,
          groupValue: selectedIndex,
          onChanged: (value) {
            ref
                .read(selectedColorProvider.notifier)
                .update((state) => state = value!);
          },
        );
      },
    );
  }
}
