import 'dart:ui';

import 'package:cinemapp/domain/datasources/local_storage/local_storage_datasource.dart';
import 'package:cinemapp/domain/entities/movies/movie.dart';

class LocalStorageIsarDatasourceImpl extends LocalStorageDatasource {
  @override
  Future<Color> getColorSchema() {
    // TODO: implement getColorSchema
    throw UnimplementedError();
  }

  @override
  Future<bool> isDarkMode() {
    // TODO: implement isDarkMode
    throw UnimplementedError();
  }

  @override
  Future<bool> isMovieFavorite(int moviId) {
    // TODO: implement isMovieFavorite
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0}) {
    // TODO: implement loadMovies
    throw UnimplementedError();
  }

  @override
  Future<void> toggleFavorite(Movie movie) {
    // TODO: implement toggleFavorite
    throw UnimplementedError();
  }
}
