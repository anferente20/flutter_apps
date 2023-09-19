import 'package:cinemapp/domain/entities/movies/movie.dart';
import 'package:cinemapp/domain/entities/tv_shows/tv_show.dart';

abstract class SearchDatasource {
  //* Search Movie
  Future<List<Movie>> searchMovies(String query);

  //* Search TvShow
  Future<List<TvShow>> searchTvShows(String query);
}
