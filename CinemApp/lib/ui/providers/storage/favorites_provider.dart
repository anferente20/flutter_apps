import 'package:cinemapp/domain/entities/movies/movie.dart';
import 'package:cinemapp/domain/repositories/local_storage/local_storage_repository.dart';
import 'package:cinemapp/ui/providers/storage/local_storage_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isFavoriteProvider = FutureProvider.family.autoDispose((ref, int movieId) {
  return ref.watch(localStorageRepoisitoryProvider).isMovieFavorite(movieId);
});

final favoritesMoviesProvider =
    StateNotifierProvider<StorageMoviesNotifier, Map<int, Movie>>((ref) {
  return StorageMoviesNotifier(localStorageRepository: ref.watch(localStorageRepoisitoryProvider));
});

class StorageMoviesNotifier extends StateNotifier<Map<int, Movie>> {
  int page = 0;
  final LocalStorageRepository localStorageRepository;

  StorageMoviesNotifier({required this.localStorageRepository}) : super({});

  Future<void> loadNextPage() async {
    final movies = await localStorageRepository.loadMovies(offset: page * 10, limit: 20);
    page++;
    final newDisplayedMovies = {};
    for (final movie in movies) {
      newDisplayedMovies[movie.id] = movie;
    }

    state = {...state, ...newDisplayedMovies};
  }
}
