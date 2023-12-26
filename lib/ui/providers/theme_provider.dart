import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

// Color list immutable
final colorListProvider = Provider((ref) => colorList);

// Boolean
final darkThemeProvider = StateProvider((ref) => false);

// Boolean
final selectedColorProvider = StateProvider((ref) => 0);

// AppTheme Object
final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

// Controller o Notifier
class ThemeNotifier extends StateNotifier<AppTheme> {
  //State == new instance
  ThemeNotifier() : super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(isDarkTheme: !state.isDarkTheme);
  }

  void changeColorIndex(int index) {
    state = state.copyWith(selectedColor: index);
  }
}
