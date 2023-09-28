import 'package:cinemapp/ui/providers/storage/theme_storage_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
  final bool isDarkMode;

  AppTheme({this.selectedColor = 0, this.isDarkMode = false})
      : assert(selectedColor >= 0, 'Selected color must be grater than 0'),
        assert(selectedColor < colorList.length,
            'Selected color must be less or equal than ${colorList.length - 1}');

  ThemeData getTheme(WidgetRef ref) {
    final theme = ref.watch(themeConfigurationProvider);

    return theme.when(
      skipLoadingOnRefresh: true,
      skipLoadingOnReload: true,
      data: (data) {
        return ThemeData(
          useMaterial3: true,
          brightness: data.isNotEmpty && data[0].isDarkMode ? Brightness.dark : Brightness.light,
          colorSchemeSeed: data.isNotEmpty ? colorList[data[0].selectedColor] : colorList[0],
          appBarTheme: const AppBarTheme(
            centerTitle: false,
          ),
        );
      },
      error: (error, stackTrace) => throw UnimplementedError(),
      loading: () => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: colorList[0],
        appBarTheme: const AppBarTheme(
          centerTitle: false,
        ),
      ),
    );
  }

  AppTheme copyWith({int? selectedColor, bool? isDarkMode}) => AppTheme(
      selectedColor: selectedColor ?? this.selectedColor,
      isDarkMode: isDarkMode ?? this.isDarkMode);
}
