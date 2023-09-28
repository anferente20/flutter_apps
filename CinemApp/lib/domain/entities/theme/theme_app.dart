import 'package:isar/isar.dart';
part 'theme_app.g.dart';

@collection
class ThemeApp {
  Id? isarID;
  final int selectedColor;
  final bool isDarkMode;

  ThemeApp({
    required this.isDarkMode,
    required this.selectedColor,
  });

  ThemeApp copyWith({int? selectedColor, bool? isDarkMode}) => ThemeApp(
        isDarkMode: isDarkMode ?? this.isDarkMode,
        selectedColor: selectedColor ?? this.selectedColor,
      );
}
