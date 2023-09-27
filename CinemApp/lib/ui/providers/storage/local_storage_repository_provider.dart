import 'package:cinemapp/infrastructure/datasources/local_storage/local_storage_isar_datasource_impl.dart';
import 'package:cinemapp/infrastructure/repository/local_storage/local_storage_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localStorageRepoisitoryProvider = Provider((ref) {
  return LocalStorageImpl(localStorageDatasource: LocalStorageIsarDatasourceImpl());
});
