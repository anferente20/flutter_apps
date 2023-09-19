import 'package:cinemapp/domain/datasources/search/search_datasource.dart';
import 'package:cinemapp/domain/entities/movies/movie.dart';
import 'package:cinemapp/domain/entities/tv_shows/tv_show.dart';
import 'package:cinemapp/domain/repositories/search/search_repository.dart';

class SearchRepositoryImpl extends SearchRepository {
  final SearchDatasource searchDatasource;
  SearchRepositoryImpl(this.searchDatasource);

  @override
  Future<List<Movie>> searchMovies(String query) {
    return searchDatasource.searchMovies(query);
  }

  @override
  Future<List<TvShow>> searchTvShows(String query) {
    return searchDatasource.searchTvShows(query);
  }

  Future<List<dynamic>> search(query) async {
    final movies = await searchMovies(query);
    final tvShows = await searchTvShows(query);
    return [...movies, ...tvShows];
  }
}
