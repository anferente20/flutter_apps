import 'package:cinemapp/domain/entities/theme/theme_app.dart';
import 'package:cinemapp/ui/providers/providers.dart';
import 'package:cinemapp/ui/widgets/shared/appbar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ConfigurationView extends ConsumerWidget {
  const ConfigurationView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Color> colors = ref.watch(colorThemProvider);
    final theme = ref.watch(themeConfigurationProvider);

    ThemeApp currentTheme = theme.when(
      data: (data) => ThemeApp(
        isDarkMode: data.isNotEmpty ? data[0].isDarkMode : false,
        selectedColor: data.isNotEmpty ? data[0].selectedColor : 0,
      ),
      error: (error, stackTrace) => throw UnimplementedError(),
      loading: () => ThemeApp(
        isDarkMode: false,
        selectedColor: 0,
      ),
    );

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
                    onPressed: () async {
                      currentTheme = currentTheme.copyWith(
                        isDarkMode: !currentTheme.isDarkMode,
                        selectedColor: currentTheme.selectedColor,
                      );

                      await ref
                          .read(themeNotifierProvider.notifier)
                          .updateConfiguration(currentTheme);
                      ref.invalidate(themeConfigurationProvider);
                    },
                    icon: Icon(currentTheme.isDarkMode
                        ? Icons.light_mode_outlined
                        : Icons.dark_mode_outlined)),
                Expanded(
                  flex: 2,
                  child: ListView.builder(
                    itemCount: colors.length,
                    itemBuilder: (context, index) {
                      final Color color = colors[index];
                      return RadioListTile(
                        activeColor: color,
                        value: index,
                        groupValue: currentTheme.selectedColor,
                        title: Text(
                          AppLocalizations.of(context)!.thisColor,
                          style: TextStyle(color: color),
                        ),
                        subtitle: Text('${color.value}'),
                        onChanged: (value) async {
                          currentTheme = currentTheme.copyWith(
                            selectedColor: index,
                            isDarkMode: currentTheme.isDarkMode,
                          );

                          await ref
                              .read(themeNotifierProvider.notifier)
                              .updateConfiguration(currentTheme);
                          ref.invalidate(themeConfigurationProvider);
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
