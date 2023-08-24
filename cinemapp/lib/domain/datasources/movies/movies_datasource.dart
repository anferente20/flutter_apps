import 'package:cinemapp/domain/entities/movie.dart';

abstract class MoviesDatasource {
  //* List of movies
  Future<List<Movie>> getLastMovies({int page = 1});
  Future<List<Movie>> getUpcoming({int page = 1});
  Future<List<Movie>> getPopular({int page = 1});
  Future<List<Movie>> getBestRated({int page = 1});

  //* Single Movie
  Future<Movie> getMovieByID(String id);
}
