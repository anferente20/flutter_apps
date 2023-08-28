import 'package:cinemapp/infrastructure/datasources/streaming_providersdb/streaming_providers_datasource_impl.dart';
import 'package:cinemapp/infrastructure/repository/streaming_providers/streaming_providersdb_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamingProviderRepositoryProvider = Provider((ref) {
  return StreamingProvidersdbRepositoryImpl(
    streamingProviderDatasource: StreamingProvidersdbDatasourceImpl(),
  );
});
