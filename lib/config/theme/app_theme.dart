import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.pink,
  Colors.deepPurple
];

class AppTheme {
  final int selectedColor;
  final bool isDarkTheme;

  AppTheme({this.isDarkTheme = false, this.selectedColor = 0})
      : assert(selectedColor >= 0, "Selected color most be greater then 0"),
        assert(selectedColor < colorList.length,
            "Selected color most be less or equals ${colorList.length - 1}");

  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      colorSchemeSeed: colorList[selectedColor],
      appBarTheme: const AppBarTheme(centerTitle: true));
}
