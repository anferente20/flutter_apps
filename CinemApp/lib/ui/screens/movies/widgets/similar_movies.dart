import 'package:cinemapp/domain/entities/movies/movie.dart';
import 'package:cinemapp/ui/providers/providers.dart';
import 'package:cinemapp/ui/widgets/movies/slides/movie_horizontal_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final similarMoviesProvider = FutureProvider.family((ref, int movieId) {
  final movieRepository = ref.watch(movieRepositoryProvider);
  return movieRepository.getSimilarMovies(movieId);
});

final similarShowsProvider = FutureProvider.family((ref, int movieId) {
  final tvShowRepository = ref.watch(tvShowRepositoryProvider);
  return tvShowRepository.getSimilarShows(movieId);
});

class SimilarMovies extends ConsumerWidget {
  final int movieId;
  final bool isMovie;

  const SimilarMovies({super.key, required this.movieId, this.isMovie = true});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final similarMoviesFuture = isMovie
        ? ref.watch(similarMoviesProvider(movieId))
        : ref.watch(similarShowsProvider(movieId));

    return similarMoviesFuture.when(
      data: (movies) => _Recomendations(movies: movies),
      error: (_, __) => Center(
          child: Text(
        AppLocalizations.of(context)!.failedLoadSimilar,
      )),
      loading: () => const Center(child: CircularProgressIndicator(strokeWidth: 2)),
    );
  }
}

class _Recomendations extends StatelessWidget {
  final List<Movie> movies;

  const _Recomendations({required this.movies});

  @override
  Widget build(BuildContext context) {
    if (movies.isEmpty) return const SizedBox();

    return Container(
      margin: const EdgeInsetsDirectional.only(bottom: 50),
      child: MoviHorizontalListview(
          title: AppLocalizations.of(context)!.recommendations, movies: movies),
    );
  }
}
