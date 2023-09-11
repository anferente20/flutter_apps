import 'package:cinemapp/ui/providers/providers.dart';
import 'package:cinemapp/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum DisplayType { movies, tvShow }

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const path = 'home-screen';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: HomeView(),
    );
  }
}

class HomeView extends ConsumerStatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(lastMoviesMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(bestRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
    ref.read(tvShowsProvider.notifier).loadNextPage();
  }

  Set<DisplayType> segmentedButtonSelection = <DisplayType>{DisplayType.movies};
  @override
  Widget build(BuildContext context) {
    if (ref.watch(initialLoadingProvider)) return const FullscreenLoader();

    final slideshowMovies = ref.watch(moviesSlideshowProvider);
    List<(DisplayType, String)> toggleOptions = [
      (
        DisplayType.movies,
        AppLocalizations.of(context)!.movies,
      ),
      (
        DisplayType.tvShow,
        AppLocalizations.of(context)!.tvShows,
      ),
    ];

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
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 250,
                height: 35,
                child: SegmentedButton<DisplayType>(
                  multiSelectionEnabled: false,
                  emptySelectionAllowed: false,
                  showSelectedIcon: false,
                  selected: segmentedButtonSelection,
                  onSelectionChanged: (Set<DisplayType> newSelection) {
                    setState(() {
                      segmentedButtonSelection = newSelection;
                    });
                  },
                  segments: toggleOptions
                      .map<ButtonSegment<DisplayType>>(((DisplayType, String) display) {
                    return ButtonSegment<DisplayType>(
                        value: display.$1,
                        label: Text(
                          display.$2,
                        ));
                  }).toList(),
                ),
              ),
              ..._getView(),
              const SizedBox(
                height: 20,
              )
            ],
          );
        }, childCount: 1))
      ],
    );
  }

  List<Widget> _getView() {
    if (segmentedButtonSelection.first == DisplayType.movies) {
      return _getMoviesView();
    } else {
      return _getTvShows();
    }
  }

  List<Widget> _getMoviesView() {
    final popularMovies = ref.watch(popularMoviesProvider);
    final bestRatedMovies = ref.watch(bestRatedMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);
    final lastMoviesMovies = ref.watch(lastMoviesMoviesProvider);

    DateTime now = DateTime.now();
    String locale = Localizations.localeOf(context).languageCode;

    return [
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
        movies: upcomingMovies,
        title: AppLocalizations.of(context)!.upcoming,
        loadNextPage: () => ref.read(upcomingMoviesProvider.notifier).loadNextPage(),
        showRate: false,
      ),
    ];
  }

  List<Widget> _getTvShows() {
    final tvShows = ref.watch(tvShowsProvider);

    return [
      MoviHorizontalListview(
        movies: tvShows,
        isMovie: false,
        showViews: false,
        title: AppLocalizations.of(context)!.tvShows,
        loadNextPage: () => ref.read(tvShowsProvider.notifier).loadNextPage(),
      ),
    ];
  }
}
