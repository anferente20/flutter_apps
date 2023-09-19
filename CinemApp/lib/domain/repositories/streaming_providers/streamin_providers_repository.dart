import 'package:cinemapp/domain/entities/streaming_providers/streaming_provider.dart';

abstract class StreamingProviderRepository {
  Future<List<StreamingProvider>> getMovieProviders(int movieID);
  Future<List<StreamingProvider>> getTvShowProviders(int tvShowID);
}
