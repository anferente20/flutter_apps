import 'package:cinemapp/domain/entities/movies/movie.dart';
import 'package:cinemapp/ui/providers/movies/movies_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final moviesSlideshowProvider = Provider<List<Movie>>((ref) {
  final lastMoviesMovies = ref.watch(lastMoviesMoviesProvider);

  if (lastMoviesMovies.isEmpty) {
    return [];
  }

  return lastMoviesMovies.sublist(0, 6);
});
