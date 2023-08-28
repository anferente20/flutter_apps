import 'package:cinemapp/config/constants/images.dart';
import 'package:cinemapp/domain/entities/streaming_provider.dart';
import 'package:cinemapp/infrastructure/models/moviedb/streaming_provider/streaming_provider_response.dart';

class StreamingProviderMapper {
  static StreamingProvider castToEntity(MovieResult movieResult) =>
      StreamingProvider(
          logo: movieResult.logoPath != null
              ? 'https://image.tmdb.org/t/p/w500${movieResult.logoPath}'
              : Images.logoNotFound,
          name: movieResult.providerName);
}
