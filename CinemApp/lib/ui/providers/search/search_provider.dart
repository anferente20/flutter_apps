import 'package:cinemapp/ui/providers/search/search_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

final searchItemsProvider = StateNotifierProvider<SearchNotifier, List<dynamic>>((ref) {
  final searchRepository = ref.read(searchRepositoryProvider);
  return SearchNotifier(
    search: searchRepository.search,
    ref: ref,
  );
});

typedef SearchCallback = Future<List<dynamic>> Function(String query);

class SearchNotifier extends StateNotifier<List<dynamic>> {
  final SearchCallback search;
  final Ref ref;

  SearchNotifier({required this.search, required this.ref}) : super([]);

  Future<List<dynamic>> searchByQuery(String query) async {
    final List<dynamic> results = await search(query);
    state = results;
    ref.read(searchQueryProvider.notifier).update((state) => query);
    return results;
  }
}
