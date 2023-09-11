import 'package:cinemapp/domain/entities/tv_show.dart';
import 'package:cinemapp/ui/providers/providers.dart';
import 'package:cinemapp/ui/screens/movies/widgets/custom_sliver_appbar.dart';
import 'package:cinemapp/ui/screens/movies/widgets/movie_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TvShowScreen extends ConsumerStatefulWidget {
  static const path = '/tv-show/';
  final String tvShowID;

  const TvShowScreen({required this.tvShowID, super.key});

  @override
  ConsumerState<TvShowScreen> createState() => _TvShowScreenState();
}

class _TvShowScreenState extends ConsumerState<TvShowScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(tvShowInfoProvider.notifier).loadTvShow(widget.tvShowID);
    ref
        .read(getActorsByTvShowProvider.notifier)
        .loadActors(int.parse(widget.tvShowID));
    ref
        .read(getTvShowStreamingProvidersProvider.notifier)
        .loadStreamingProviders(int.parse(widget.tvShowID));
  }

  @override
  Widget build(BuildContext context) {
    final TvShow? movie = ref.watch(tvShowInfoProvider)[widget.tvShowID];
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
              (context, index) => MovieDetails(
                movie: movie,
                isMovie: false,
              ),
              childCount: 1,
            ),
          )
        ],
      ),
    );
  }
}
