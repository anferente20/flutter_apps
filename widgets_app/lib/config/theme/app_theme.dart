import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.redAccent,
  Colors.blueAccent,
  Colors.greenAccent,
  Colors.amberAccent,
  Colors.orangeAccent,
  Colors.purpleAccent,
  Colors.deepOrangeAccent,
  Colors.deepPurpleAccent,
  Colors.cyanAccent,
  Colors.tealAccent,
  Colors.indigoAccent,
  Colors.limeAccent
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0, 'Selected color must be grater than 0'),
        assert(selectedColor < colorList.length,
            'Selected color must be less or equal than ${colorList.length - 1}');

  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colorList[selectedColor],
      appBarTheme: const AppBarTheme(centerTitle: false));
}
