import 'package:cinemapp/domain/entities/tv_shows/tv_show.dart';
import 'package:cinemapp/ui/providers/tv_shows/tv_show_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tvShowInfoProvider = StateNotifierProvider<TvShowMapNotifier, Map<String, TvShow>>((ref) {
  final getTvShow = ref.watch(tvShowRepositoryProvider).getTvShowByID;

  return TvShowMapNotifier(getTvShow: getTvShow);
});

typedef GetTvShowCallback = Future<TvShow> Function(String tvShowID);

class TvShowMapNotifier extends StateNotifier<Map<String, TvShow>> {
  TvShowMapNotifier({required this.getTvShow}) : super({});

  final GetTvShowCallback getTvShow;

  Future<void> loadTvShow(String tvShowID) async {
    if (state.containsKey(tvShowID)) return;
    final tvShow = await getTvShow(tvShowID);
    state = {...state, tvShowID: tvShow};
  }
}
