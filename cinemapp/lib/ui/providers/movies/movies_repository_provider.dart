import 'package:cinemapp/infrastructure/datasources/movies/moviedb_datasource_impl.dart';
import 'package:cinemapp/infrastructure/repository/moviedb_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieRepositoryProvider = Provider((ref) {
  return MoviedbRepositoryImpl(MoviedbDatasourceImpl());
});
