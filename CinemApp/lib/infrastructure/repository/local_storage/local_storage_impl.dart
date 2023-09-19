import 'dart:ui';

import 'package:cinemapp/domain/datasources/local_storage/local_storage_datasource.dart';
import 'package:cinemapp/domain/entities/movies/movie.dart';
import 'package:cinemapp/domain/repositories/local_storage/local_storage_repository.dart';

class LocalStorageImpl extends LocalStorageRepository {
  final LocalStorageDatasource localStorageDatasource;

  LocalStorageImpl({required this.localStorageDatasource});

  @override
  Future<Color> getColorSchema() {
    return localStorageDatasource.getColorSchema();
  }

  @override
  Future<bool> isDarkMode() {
    return localStorageDatasource.isDarkMode();
  }

  @override
  Future<bool> isMovieFavorite(int moviId) {
    return localStorageDatasource.isMovieFavorite(moviId);
  }

  @override
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0}) {
    return localStorageDatasource.loadMovies(limit: limit, offset: offset);
  }

  @override
  Future<void> toggleFavorite(Movie movie) {
    return localStorageDatasource.toggleFavorite(movie);
  }
}
