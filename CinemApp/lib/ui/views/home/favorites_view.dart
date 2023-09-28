import 'package:cinemapp/ui/providers/storage/favorites_provider.dart';
import 'package:cinemapp/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    return Scaffold(
        body: MoviesMasonryGridState(
      movies: favorites,
      loadNextPage: loadNextPage,
    ));
  }
}
