import 'package:cinemapp/domain/datasources/local_storage/local_storage_datasource.dart';
import 'package:cinemapp/domain/entities/movies/movie.dart';
import 'package:cinemapp/domain/entities/theme/theme_app.dart';
import 'package:cinemapp/domain/repositories/local_storage/local_storage_repository.dart';

class LocalStorageImpl extends LocalStorageRepository {
  final LocalStorageDatasource localStorageDatasource;

  LocalStorageImpl({required this.localStorageDatasource});

  @override
  Future<bool> isMovieFavorite(int movieId) {
    return localStorageDatasource.isMovieFavorite(movieId);
  }

  @override
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0}) {
    return localStorageDatasource.loadMovies(limit: limit, offset: offset);
  }

  @override
  Future<void> toggleFavorite(Movie movie) {
    return localStorageDatasource.toggleFavorite(movie);
  }

  @override
  Future<List<ThemeApp>> getThemeconfiguration() {
    return localStorageDatasource.getThemeconfiguration();
  }

  @override
  Future<void> setThemeconfiguration(ThemeApp theme) {
    return localStorageDatasource.setThemeconfiguration(theme);
  }
}
