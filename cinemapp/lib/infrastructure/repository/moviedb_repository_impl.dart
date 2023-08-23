import 'package:cinemapp/domain/datasources/movies/movies_datasource.dart';
import 'package:cinemapp/domain/entities/movie.dart';
import 'package:cinemapp/domain/repositories/movies/movies_repository.dart';

class MoviedbRepositoryImpl extends MoviesRepository {
  final MoviesDatasource moviesDatasource;

  MoviedbRepositoryImpl(this.moviesDatasource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return moviesDatasource.getNowPlaying(page: page);
  }
}
