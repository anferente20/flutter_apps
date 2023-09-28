import 'package:cinemapp/domain/entities/movies/movie.dart';
import 'package:cinemapp/domain/repositories/local_storage/local_storage_repository.dart';
import 'package:cinemapp/ui/providers/providers.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final isFavoriteProvider = FutureProvider.family.autoDispose((ref, int movieId) {
  return ref.watch(localStorageRepoisitoryProvider).isMovieFavorite(movieId);
});

final favoritesMoviesProvider =
    StateNotifierProvider<StorageMoviesNotifier, Map<int, Movie>>((ref) {
  final fetchMoreFavorites = ref.watch(localStorageRepoisitoryProvider).loadMovies;
  return StorageMoviesNotifier(
      localStorageRepository: ref.watch(localStorageRepoisitoryProvider),
      fetchMoreFavorites: fetchMoreFavorites);
});

typedef FavoritesCallback = Future<List<Movie>> Function({int limit, int offset});

class StorageMoviesNotifier extends StateNotifier<Map<int, Movie>> {
  int page = 0;
  final LocalStorageRepository localStorageRepository;
  FavoritesCallback fetchMoreFavorites;

  StorageMoviesNotifier({required this.localStorageRepository, required this.fetchMoreFavorites})
      : super({});

  Future<List<Movie>> loadNextPage() async {
    final movies = await localStorageRepository.loadMovies(offset: page * 10, limit: 20);
    page++;
    final newDisplayedMovies = {};
    for (final movie in movies) {
      newDisplayedMovies[movie.id] = movie;
    }

    state = {...state, ...newDisplayedMovies};
    return movies;
  }

  Future<void> toggleFavorite(Movie movie) async {
    await localStorageRepository.toggleFavorite(movie);
    final bool isMovieInFavorites = state[movie.id] != null;
    if (isMovieInFavorites) {
      state.remove(movie.id);
      state = {...state};
    } else {
      state = {...state, movie.id: movie};
    }
  }
}
