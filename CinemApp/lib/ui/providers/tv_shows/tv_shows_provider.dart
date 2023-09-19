import 'package:cinemapp/domain/entities/tv_shows/tv_show.dart';
import 'package:cinemapp/ui/providers/tv_shows/tv_show_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//* tv shows
final tvShowsProvider = StateNotifierProvider<TvShowsNotifier, List<TvShow>>((ref) {
  final fetchMoreTvShows = ref.watch(tvShowRepositoryProvider).getBestRated;

  return TvShowsNotifier(fetchMoreTvShows: fetchMoreTvShows);
});

typedef TvShowCallback = Future<List<TvShow>> Function({int page});

class TvShowsNotifier extends StateNotifier<List<TvShow>> {
  TvShowsNotifier({required this.fetchMoreTvShows}) : super([]);

  int currentPage = 0;
  bool isLoading = false;
  TvShowCallback fetchMoreTvShows;

  Future<void> loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    currentPage++;
    final List<TvShow> movies = await fetchMoreTvShows(page: currentPage);
    state = [...state, ...movies];
    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
  }
}
