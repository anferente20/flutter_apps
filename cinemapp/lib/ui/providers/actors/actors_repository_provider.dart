import 'package:cinemapp/infrastructure/datasources/actors/actorsdb_datasource_impl.dart';
import 'package:cinemapp/infrastructure/repository/actors/actorsdb_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorRepositoryProvider = Provider((ref) {
  return ActorsdbRepositoryImpl(ActorsdbDatasourceImpl());
});
