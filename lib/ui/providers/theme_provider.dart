import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

// Color list immutable
final colorListProvider = Provider((ref) => colorList);

// Boolean
final darkThemeProvider = StateProvider((ref) => false);

// Boolean
final selectedColorProvider = StateProvider((ref) => 0);
