import 'package:cinemapp/ui/providers/theme/theme_provider.dart';
import 'package:cinemapp/ui/widgets/shared/appbar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ConfigurationView extends ConsumerWidget {
  const ConfigurationView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Color> colors = ref.watch(colorThemProvider);
    final int selectedColor = ref.watch(themeNotifierProvider).selectedColor;
    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: CustomAppbar(),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                IconButton(
                    onPressed: () {
                      ref.read(themeNotifierProvider.notifier).changeDarkMode();
                    },
                    icon: Icon(isDarkMode ? Icons.light_mode_outlined : Icons.dark_mode_outlined)),
                Expanded(
                  flex: 2,
                  child: ListView.builder(
                    itemCount: colors.length,
                    itemBuilder: (context, index) {
                      final Color color = colors[index];
                      return RadioListTile(
                        activeColor: color,
                        value: index,
                        groupValue: selectedColor,
                        title: Text(
                          AppLocalizations.of(context)!.thisColor,
                          style: TextStyle(color: color),
                        ),
                        subtitle: Text('${color.value}'),
                        onChanged: (value) {
                          ref.read(themeNotifierProvider.notifier).changeColor(index);
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          );
        }, childCount: 1))
      ],
    );
  }
}
