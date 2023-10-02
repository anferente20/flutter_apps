import 'package:cinemapp/domain/entities/movies/movie.dart';
import 'package:cinemapp/domain/entities/video/video.dart';

abstract class MoviesRepository {
  //* List of movies
  Future<List<Movie>> getLastMovies({int page = 1});
  Future<List<Movie>> getUpcoming({int page = 1});
  Future<List<Movie>> getPopular({int page = 1});
  Future<List<Movie>> getBestRated({int page = 1});
  Future<List<Movie>> getSimilarMovies(int movieId);

  //* Single Movie
  Future<Movie> getMovieByID(String id);
  Future<List<Video>> getYoutubeVideosById(int movieId);
}
