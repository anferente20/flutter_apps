import 'package:cinemapp/ui/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:cinemapp/ui/providers/providers.dart';
import 'package:flutter/material.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    ref.read(lastMoviesMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(bestRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
    ref.read(tvShowsProvider.notifier).loadNextPage();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (ref.watch(initialLoadingProvider)) return const FullscreenLoader();

    final slideshowMovies = ref.watch(moviesSlideshowProvider);

    final lastMoviesMovies = ref.watch(lastMoviesMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final bestRatedMovies = ref.watch(bestRatedMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);

    final tvShows = ref.watch(tvShowsProvider);

    DateTime now = DateTime.now();
    String locale = Localizations.localeOf(context).languageCode;

    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: CustomAppbar(),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return Column(
            children: [
              MoviesSlideshow(movies: slideshowMovies),
              MoviHorizontalListview(
                movies: lastMoviesMovies,
                title: AppLocalizations.of(context)!.lastMovies,
                subtitle: '${DateFormat('EEEE d', locale).format(now)} ',
                loadNextPage: () => ref.read(lastMoviesMoviesProvider.notifier).loadNextPage(),
              ),
              MoviHorizontalListview(
                movies: bestRatedMovies,
                title: AppLocalizations.of(context)!.bestRated,
                loadNextPage: () => ref.read(bestRatedMoviesProvider.notifier).loadNextPage(),
              ),
              MoviHorizontalListview(
                movies: popularMovies,
                title: AppLocalizations.of(context)!.popular,
                loadNextPage: () => ref.read(popularMoviesProvider.notifier).loadNextPage(),
              ),
              MoviHorizontalListview(
                movies: tvShows,
                title: AppLocalizations.of(context)!.tvShows,
                loadNextPage: () => ref.read(tvShowsProvider.notifier).loadNextPage(),
              ),
              if (upcomingMovies.isNotEmpty)
                MoviHorizontalListview(
                  movies: upcomingMovies,
                  title: AppLocalizations.of(context)!.upcoming,
                  loadNextPage: () => ref.read(upcomingMoviesProvider.notifier).loadNextPage(),
                  showRate: false,
                ),
              const SizedBox(
                height: 20,
              )
            ],
          );
        }, childCount: 1))
      ],
    );
  }
}
