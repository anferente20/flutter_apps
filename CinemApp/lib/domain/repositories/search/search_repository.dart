import 'package:cinemapp/domain/entities/movie.dart';
import 'package:cinemapp/domain/entities/tv_show.dart';

abstract class SearchRepository {
  //* Search Movie
  Future<List<Movie>> searchMovies(String query);

  //* Search TvShow
  Future<List<TvShow>> searchTvShows(String query);
}
