import 'package:cinemapp/domain/entities/movie.dart';

abstract class MoviesDatasource {
  Future<List<Movie>> getNowPlayinf({int page = 1});
}
