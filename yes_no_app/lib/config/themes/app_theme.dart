import 'package:flutter/material.dart';

const _customColor = Color.fromARGB(255, 231, 54, 0);

const List<Color> _themeColors = [
  _customColor,
  Colors.blueAccent,
  Colors.greenAccent,
  Colors.yellowAccent,
  Colors.orangeAccent,
  Colors.deepOrangeAccent,
  Colors.purpleAccent,
  Colors.deepPurpleAccent,
  Colors.lightGreen
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor <= _themeColors.length - 1,
            'Colors must be between 0 and ${_themeColors.length - 1}');

  ThemeData theme() {
    return ThemeData(
        useMaterial3: true, colorSchemeSeed: _themeColors[selectedColor]);
  }
}
