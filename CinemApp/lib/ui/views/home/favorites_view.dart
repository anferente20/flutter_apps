import 'package:cinemapp/ui/providers/storage/favorites_provider.dart';
import 'package:cinemapp/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  ConsumerState<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends ConsumerState<FavoritesView> {
  bool isLastPage = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loadNextPage();
  }

  void loadNextPage() async {
    if (isLastPage || isLoading) return;
    isLoading = true;
    final movies = await ref.read(favoritesMoviesProvider.notifier).loadNextPage();
    isLoading = false;
    isLastPage = movies.isEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final favorites = ref.watch(favoritesMoviesProvider).values.toList();
    final color = Theme.of(context).colorScheme.primary;
    return Scaffold(
        body: favorites.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.heart_broken_outlined,
                      size: 60,
                      color: color,
                    ),
                    Text(
                      AppLocalizations.of(context)!.ohNo,
                      style: TextStyle(fontSize: 30, color: color),
                    ),
                    Text(
                      AppLocalizations.of(context)!.noFavorites,
                      style: const TextStyle(fontSize: 20, color: Colors.black45),
                    ),
                  ],
                ),
              )
            : MoviesMasonryGridState(
                movies: favorites,
                loadNextPage: loadNextPage,
              ));
  }
}
