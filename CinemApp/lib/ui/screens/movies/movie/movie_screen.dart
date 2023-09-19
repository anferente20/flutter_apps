import 'package:cinemapp/domain/entities/movies/movie.dart';
import 'package:cinemapp/ui/providers/movies/movie_info_provider.dart';
import 'package:cinemapp/ui/providers/providers.dart';
import 'package:cinemapp/ui/screens/movies/widgets/custom_sliver_appbar.dart';
import 'package:cinemapp/ui/screens/movies/widgets/movie_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieScreen extends ConsumerStatefulWidget {
  static const path = '/movie/';
  final String movieID;

  const MovieScreen({required this.movieID, super.key});

  @override
  ConsumerState<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends ConsumerState<MovieScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(movieInfoProvider.notifier).loadMovie(widget.movieID);
    ref.read(getActorsByMovieProvider.notifier).loadActors(int.parse(widget.movieID));
    ref
        .read(getStreamingProvidersProvider.notifier)
        .loadStreamingProviders(int.parse(widget.movieID));
  }

  @override
  Widget build(BuildContext context) {
    final Movie? movie = ref.watch(movieInfoProvider)[widget.movieID];
    if (movie == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      );
    }

    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          CustomSliverAppbar(movie: movie),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => MovieDetails(movie: movie),
              childCount: 1,
            ),
          )
        ],
      ),
    );
  }
}
