import 'package:cinemapp/domain/datasources/movies/movies_datasource.dart';
import 'package:cinemapp/domain/entities/movies/movie.dart';
import 'package:cinemapp/domain/entities/video/video.dart';
import 'package:cinemapp/domain/repositories/movies/movies_repository.dart';

class MoviedbRepositoryImpl extends MoviesRepository {
  final MoviesDatasource moviesDatasource;

  MoviedbRepositoryImpl(this.moviesDatasource);

  @override
  Future<List<Movie>> getLastMovies({int page = 1}) {
    return moviesDatasource.getLastMovies(page: page);
  }

  @override
  Future<List<Movie>> getBestRated({int page = 1}) {
    return moviesDatasource.getBestRated(page: page);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    return moviesDatasource.getPopular(page: page);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) {
    return moviesDatasource.getUpcoming(page: page);
  }

  //* Single Movie
  @override
  Future<Movie> getMovieByID(String id) {
    return moviesDatasource.getMovieByID(id);
  }

  @override
  Future<List<Video>> getYoutubeVideosById(int movieId) {
    return moviesDatasource.getYoutubeVideosById(movieId);
  }

  @override
  Future<List<Movie>> getSimilarMovies(int movieId) {
    return moviesDatasource.getSimilarMovies(movieId);
  }
}
