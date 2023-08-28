import 'package:cinemapp/infrastructure/datasources/tv_shows/tv_showdb_datasource_impl.dart';
import 'package:cinemapp/infrastructure/repository/tv_shows/tv_showsdb_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tvShowRepositoryProvider = Provider((ref) {
  return TvShowsdbRepositoryImpl(TvShowsDatasourceImpl());
});
