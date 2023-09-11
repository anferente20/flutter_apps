import 'package:cinemapp/ui/providers/movies/movies_providers.dart';
import 'package:cinemapp/ui/providers/tv_shows/tv_shows_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final initialLoadingProvider = Provider<bool>((ref) {
  final popularMovies = ref.watch(popularMoviesProvider).isEmpty;
  final bestRatedMovies = ref.watch(bestRatedMoviesProvider).isEmpty;
  final upcomingMovies = ref.watch(upcomingMoviesProvider).isEmpty;
  final lastMoviesMovies = ref.watch(lastMoviesMoviesProvider).isEmpty;
  final tvShowsMovies = ref.watch(tvShowsProvider).isEmpty;

  return (popularMovies ||
      bestRatedMovies ||
      upcomingMovies ||
      lastMoviesMovies ||
      tvShowsMovies);
});
