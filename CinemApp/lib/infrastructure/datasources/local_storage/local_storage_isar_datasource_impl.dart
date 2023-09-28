import 'package:cinemapp/domain/datasources/local_storage/local_storage_datasource.dart';
import 'package:cinemapp/domain/entities/movies/movie.dart';
import 'package:cinemapp/domain/entities/theme/theme_app.dart';
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
      return await Isar.open([MovieSchema, ThemeAppSchema], directory: dir.path, inspector: true);
    }
    return Future.value(Isar.getInstance());
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

  @override
  Future<List<ThemeApp>> getThemeconfiguration() async {
    final isar = await db;
    return await isar.themeApps.where().findAll();
  }

  @override
  Future<void> setThemeconfiguration(ThemeApp theme) async {
    final isar = await db;
    final ThemeApp? isarTheme = await isar.themeApps.where().findFirst();
    if (isarTheme != null) {
      isar.writeTxnSync(() => isar.themeApps.deleteSync(isarTheme.isarID!));
    }
    isar.writeTxnSync(() => isar.themeApps.putSync(theme));
  }
}
