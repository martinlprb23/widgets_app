import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/ui/providers/theme_provider.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    //final selectedColor = ref.watch(selectedColorProvider);
    //final isDarkMode = ref.watch(darkThemeProvider);
    final appTheme = ref.watch(themeNotifierProvider);

    return MaterialApp.router(
      title: 'Flutter widgets',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme(
              selectedColor: appTheme.selectedColor,
              isDarkTheme: appTheme.isDarkTheme)
          .getTheme(),
      /*routes: {
        "/buttons": (context) => const ButtonsScreen(),
        "/cards": (context) => const CardsScreen()
      },*/
    );
  }
}
