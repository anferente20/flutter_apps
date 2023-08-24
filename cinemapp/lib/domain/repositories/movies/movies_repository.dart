import 'package:cinemapp/domain/entities/movie.dart';

abstract class MoviesRepository {
  Future<List<Movie>> getLastMovies({int page = 1});
  Future<List<Movie>> getUpcoming({int page = 1});
  Future<List<Movie>> getPopular({int page = 1});
  Future<List<Movie>> getBestRated({int page = 1});
}
