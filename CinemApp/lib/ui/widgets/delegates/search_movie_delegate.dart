import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:cinemapp/domain/entities/movie.dart';
import 'package:cinemapp/domain/entities/tv_show.dart';
import 'package:cinemapp/ui/widgets/shared/search/search_result_item.dart';
import 'package:flutter/material.dart';

typedef SearchMoviesCallback = Future<List<dynamic>> Function(String query);

class SearchMovieDelegate extends SearchDelegate<Movie?> {
  final String label;
  final SearchMoviesCallback search;
  List<dynamic> initialItems;

  SearchMovieDelegate({
    required this.label,
    required this.search,
    required this.initialItems,
  }) : super(searchFieldLabel: label);

  final StreamController<List<dynamic>> debounceQuery = StreamController.broadcast();
  final StreamController<bool> isLoadingStream = StreamController.broadcast();
  Timer? _debounceTimer;

  void clearStream() {
    debounceQuery.close();
    isLoadingStream.close();
  }

  void _onQueryChange(String query) {
    if (_debounceTimer?.isActive ?? false) {
      isLoadingStream.add(true);
      _debounceTimer!.cancel();
    }
    _debounceTimer = Timer(
      const Duration(milliseconds: 500),
      () async {
        final movies = await search(query);
        debounceQuery.add(movies);
        isLoadingStream.add(false);
        initialItems = movies;
      },
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      StreamBuilder(
        stream: isLoadingStream.stream,
        initialData: false,
        builder: (context, snapshot) {
          final isLoading = snapshot.data ?? false;
          return isLoading
              ? SpinPerfect(
                  duration: const Duration(seconds: 20),
                  infinite: true,
                  spins: 10,
                  animate: query.isNotEmpty,
                  child: IconButton(
                    onPressed: () => query = '',
                    icon: const Icon(
                      Icons.refresh_outlined,
                    ),
                  ),
                )
              : FadeIn(
                  animate: query.isNotEmpty,
                  child: IconButton(
                    onPressed: () => query = '',
                    icon: const Icon(
                      Icons.clear,
                    ),
                  ),
                );
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        clearStream();
        close(context, null);
      },
      icon: const Icon(
        Icons.arrow_back_ios_new_outlined,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildResultSuggestions();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildResultSuggestions();
  }

  StreamBuilder<dynamic> buildResultSuggestions() {
    _onQueryChange(query);
    return StreamBuilder(
      stream: debounceQuery.stream,
      initialData: initialItems,
      builder: (context, snapshot) {
        final results = snapshot.data ?? [];
        return ListView.builder(
          itemCount: results.length,
          itemBuilder: (context, index) {
            final item = results[index];
            return SearchResultItem(
              item: item,
              isTvShow: item is TvShow,
              onMovieSelected: (movie) {
                clearStream();
                close(context, movie);
              },
            );
          },
        );
      },
    );
  }
}
