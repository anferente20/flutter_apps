import 'package:cinemapp/domain/entities/movies/movie.dart';
import 'package:cinemapp/ui/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieInfoProvider = StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>((ref) {
  final getMovie = ref.watch(movieRepositoryProvider).getMovieByID;

  return MovieMapNotifier(getMovie: getMovie);
});

typedef GetMovieCallback = Future<Movie> Function(String movieID);

class MovieMapNotifier extends StateNotifier<Map<String, Movie>> {
  MovieMapNotifier({required this.getMovie}) : super({});

  final GetMovieCallback getMovie;

  Future<void> loadMovie(String movieID) async {
    if (state.containsKey(movieID)) return;
    final movie = await getMovie(movieID);
    state = {...state, movieID: movie};
  }
}
