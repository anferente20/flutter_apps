import 'package:cinemapp/ui/providers/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeSelectorView extends ConsumerWidget {
  const ThemeSelectorView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Color> colors = ref.watch(colorThemProvider);
    final int selectedColor = ref.watch(themeNotifierProvider).selectedColor;
    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;
    return Column(
      children: [
        IconButton(
            onPressed: () {
              ref.read(themeNotifierProvider.notifier).changeDarkMode();
            },
            icon: Icon(isDarkMode ? Icons.light_mode_outlined : Icons.dark_mode_outlined)),
        ListView.builder(
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
        )
      ],
    );
  }
}
