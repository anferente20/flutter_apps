import 'package:cinemapp/domain/entities/theme/theme_app.dart';
import 'package:cinemapp/domain/repositories/local_storage/local_storage_repository.dart';
import 'package:cinemapp/ui/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapp/config/theme/app_theme.dart';

//Colors list
final colorThemProvider = StateProvider((ref) => colorList);

//Dark mode
final themeProvider = StateProvider((ref) => true);

//selected Color
final selectedColorProvider = StateProvider((ref) => 5);

//Objeto AppTheme
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(localStorageRepository: ref.watch(localStorageRepoisitoryProvider)),
);

class ThemeNotifier extends StateNotifier<AppTheme> {
  final LocalStorageRepository localStorageRepository;
  ThemeNotifier({
    required this.localStorageRepository,
  }) : super(AppTheme());

  Future<void> updateConfiguration(ThemeApp theme) async {
    state = state.copyWith(isDarkMode: theme.isDarkMode, selectedColor: theme.selectedColor);
    await localStorageRepository.setThemeconfiguration(ThemeApp(
      isDarkMode: state.isDarkMode,
      selectedColor: state.selectedColor,
    ));
  }

  Future<List<ThemeApp>> getThemeconfiguration() async {
    return await localStorageRepository.getThemeconfiguration();
  }
}
