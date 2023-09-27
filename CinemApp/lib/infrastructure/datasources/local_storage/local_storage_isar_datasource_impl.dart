import 'dart:ui';

import 'package:cinemapp/domain/datasources/local_storage/local_storage_datasource.dart';
import 'package:cinemapp/domain/entities/movies/movie.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class LocalStorageIsarDatasourceImpl extends LocalStorageDatasource {
  late Future<Isar> db;

  LocalStorageIsarDatasourceImpl() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open([MovieSchema], directory: dir.path, inspector: true);
    }
    return Future.value(Isar.getInstance());
  }

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
  Future<bool> isMovieFavorite(int moviId) async {
    final isar = await db;
    final Movie? isFavoriteMovie = await isar.movies.filter().idEqualTo(moviId).findFirst();
    return isFavoriteMovie != null;
  }

  @override
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0}) async {
    final isar = await db;
    return await isar.movies.where().offset(offset).limit(limit).findAll();
  }

  @override
  Future<void> toggleFavorite(Movie movie) async {
    final isar = await db;
    final Movie? favoriteMovie = await isar.movies.filter().idEqualTo(movie.id).findFirst();
    if (favoriteMovie != null) {
      isar.writeTxnSync(() => isar.movies.deleteSync(favoriteMovie.isarID!));
      return;
    }
    isar.writeTxnSync(() => isar.movies.putSync(movie));
  }
}
