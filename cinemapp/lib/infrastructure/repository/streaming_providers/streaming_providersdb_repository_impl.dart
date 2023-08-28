import 'package:cinemapp/domain/datasources/streaming_provider/provider_datasource.dart';
import 'package:cinemapp/domain/entities/streaming_provider.dart';
import 'package:cinemapp/domain/repositories/streaming_providers/streamin_providers_repository.dart';

class StreamingProvidersdbRepositoryImpl extends StreamingProviderRepository {
  final StreamingProviderDatasource streamingProviderDatasource;

  StreamingProvidersdbRepositoryImpl(
      {required this.streamingProviderDatasource});

  @override
  Future<List<StreamingProvider>> getMovieProviders(int movieID) {
    return streamingProviderDatasource.getMovieProviders(movieID);
  }

  @override
  Future<List<StreamingProvider>> getTvShowProviders(int tvShowID) {
    return streamingProviderDatasource.getTvShowProviders(tvShowID);
  }
}
