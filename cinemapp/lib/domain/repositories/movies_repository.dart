import 'package:cinemapp/domain/entities/movie.dart';

abstract class MoviesRepository {
  Future<List<Movie>> getNowPlayinf({int page = 1});
}
