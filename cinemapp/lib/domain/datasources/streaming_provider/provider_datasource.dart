import 'package:cinemapp/domain/entities/streaming_provider.dart';

abstract class StreamingProviderDatasource {
  Future<List<StreamingProvider>> getMovieProviders(int movieID);
  Future<List<StreamingProvider>> getTvShowProviders(int tvShowID);
}
