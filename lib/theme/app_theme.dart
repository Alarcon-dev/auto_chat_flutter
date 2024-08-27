import "package:flutter/material.dart";

const List<Color> colorApp = [
  Colors.red,
  Colors.yellow,
  Colors.green,
  Colors.purple,
  Colors.pink,
  Colors.orange
];

class AppTheme {
  int colorSelector;

  AppTheme({required this.colorSelector});

  ThemeData theme() {
    return ThemeData(
        useMaterial3: true, colorSchemeSeed: colorApp[colorSelector]);
  }
}
