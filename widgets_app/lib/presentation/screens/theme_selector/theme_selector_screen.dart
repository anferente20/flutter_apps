import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme/theme_provider.dart';

class ThemeSelectorScreen extends ConsumerWidget {
  const ThemeSelectorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                ref.read(themeNotifierProvider.notifier).changeDarkMode();
              },
              icon: Icon(isDarkMode ? Icons.light_mode_outlined : Icons.dark_mode_outlined))
        ],
        title: const Text('Theme Selector'),
      ),
      body: const _ThemeSelectorView(),
    );
  }
}

class _ThemeSelectorView extends ConsumerWidget {
  const _ThemeSelectorView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Color> colors = ref.watch(colorThemProvider);
    final int selectedColor = ref.watch(themeNotifierProvider).selectedColor;

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final Color color = colors[index];
        return RadioListTile(
          activeColor: color,
          value: index,
          groupValue: selectedColor,
          title: Text(
            'Este color',
            style: TextStyle(color: color),
          ),
          subtitle: Text('${color.value}'),
          onChanged: (value) {
            ref.read(themeNotifierProvider.notifier).changeColor(index);
          },
        );
      },
    );
  }
}
