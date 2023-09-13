import 'package:cinemapp/domain/entities/movie.dart';
import 'package:cinemapp/ui/providers/providers.dart';
import 'package:cinemapp/ui/widgets/delegates/search_movie_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomAppbar extends ConsumerWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;
    return SafeArea(
      bottom: false,
      child: Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                Icon(
                  Icons.movie_outlined,
                  color: colors.primary,
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  'CienmApp',
                  style: titleStyle,
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    final searchQuery = ref.read(searchQueryProvider);
                    final initialItems = ref.read(searchItemsProvider);

                    showSearch<Movie?>(
                      query: searchQuery,
                      context: context,
                      delegate: SearchMovieDelegate(
                        initialItems: initialItems,
                        label: AppLocalizations.of(context)!.search,
                        search: ref.read(searchItemsProvider.notifier).searchByQuery,
                      ),
                    );
                  },
                  icon: const Icon(Icons.search_outlined),
                )
              ],
            ),
          )),
    );
  }
}
