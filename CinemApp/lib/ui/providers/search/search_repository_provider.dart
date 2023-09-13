import 'package:cinemapp/infrastructure/datasources/search/search_datasource_impl.dart';
import 'package:cinemapp/infrastructure/repository/search/search_respository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchRepositoryProvider = Provider((ref) {
  return SearchRepositoryImpl(SearchDatasourceImpl());
});
