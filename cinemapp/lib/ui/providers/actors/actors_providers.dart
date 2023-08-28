import 'package:cinemapp/domain/entities/actors.dart';
import 'package:cinemapp/ui/providers/actors/actors_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//* actors by movie
final getActorsProvider =
    StateNotifierProvider<ActorsNotifier, Map<int, List<Actor>>>((ref) {
  final fetchActors = ref.watch(actorRepositoryProvider).getActorsByMovie;

  return ActorsNotifier(fetchActors: fetchActors);
});

typedef GetActorCallback = Future<List<Actor>> Function(int movieID);

class ActorsNotifier extends StateNotifier<Map<int, List<Actor>>> {
  ActorsNotifier({required this.fetchActors}) : super({});

  int currentPage = 0;
  bool isLoading = false;
  GetActorCallback fetchActors;

  Future<void> loadActors(int movieID) async {
    if (state[movieID] != null) return;
    final List<Actor> actors = await fetchActors(movieID);
    state = {...state, movieID: actors};
  }
}
