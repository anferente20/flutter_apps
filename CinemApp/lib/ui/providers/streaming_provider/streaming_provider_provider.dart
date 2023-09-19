import 'package:cinemapp/domain/entities/streaming_providers/streaming_provider.dart';
import 'package:cinemapp/ui/providers/streaming_provider/streaming_provider_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//* streamingProviders by movie
final getStreamingProvidersProvider =
    StateNotifierProvider<StreamingProvidersNotifier, Map<int, List<StreamingProvider>>>((ref) {
  final fetchStreamingProviders = ref.watch(streamingProviderRepositoryProvider).getMovieProviders;

  return StreamingProvidersNotifier(fetchStreamingProviders: fetchStreamingProviders);
});

//* streamingProviders by tv show
final getTvShowStreamingProvidersProvider =
    StateNotifierProvider<StreamingProvidersNotifier, Map<int, List<StreamingProvider>>>((ref) {
  final fetchStreamingProviders = ref.watch(streamingProviderRepositoryProvider).getTvShowProviders;

  return StreamingProvidersNotifier(fetchStreamingProviders: fetchStreamingProviders);
});

typedef GetStreamingProviderCallback = Future<List<StreamingProvider>> Function(int movieID);

class StreamingProvidersNotifier extends StateNotifier<Map<int, List<StreamingProvider>>> {
  StreamingProvidersNotifier({required this.fetchStreamingProviders}) : super({});

  bool isLoading = false;
  GetStreamingProviderCallback fetchStreamingProviders;

  Future<void> loadStreamingProviders(int movieID) async {
    if (state[movieID] != null) return;
    final List<StreamingProvider> actors = await fetchStreamingProviders(movieID);
    state = {...state, movieID: actors};
  }
}
