import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

//Colors list
final colorThemProvider = StateProvider((ref) => colorList);

//Dark mode
final themeProvider = StateProvider((ref) => true);

//selected Color
final selectedColorProvider = StateProvider((ref) => 5);

//Objeto AppTheme
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);

class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier() : super(AppTheme());

  void changeDarkMode() {
    state = AppTheme().copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColor(int colorIndex) {
    state = AppTheme().copyWith(selectedColor: colorIndex);
  }
}
