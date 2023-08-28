import 'package:cinemapp/config/constants/environment.dart';
import 'package:cinemapp/domain/datasources/streaming_provider/provider_datasource.dart';
import 'package:cinemapp/domain/entities/streaming_provider.dart';
import 'package:cinemapp/infrastructure/mappers/streaming_provider_mapper.dart';
import 'package:cinemapp/infrastructure/models/moviedb/streaming_provider/streaming_provider_response.dart';
import 'package:devicelocale/devicelocale.dart';
import 'package:dio/dio.dart';

class StreamingProvidersdbDatasourceImpl extends StreamingProviderDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Enviroment.theMovieDBKey,
        'language': 'es-CO'
      },
    ),
  );

  @override
  Future<List<StreamingProvider>> getMovieProviders(int movieID) async {
    final response = await dio.get('/movie/$movieID/watch/providers');
    final StreamingProvidersResponse streamingResponse =
        StreamingProvidersResponse.fromJson(response.data);

    String? locale = await Devicelocale.currentLocale;

    List<StreamingProvider> providers = [];
    if (streamingResponse.results.countries[locale?.split('-')[1]]?.flatrate !=
        null) {
      providers = streamingResponse
          .results.countries[locale?.split('-')[1]]!.flatrate!
          .map((movieResult) =>
              StreamingProviderMapper.castToEntity(movieResult))
          .toList();
    }
    return providers;
  }

  @override
  Future<List<StreamingProvider>> getTvShowProviders(int tvShowID) async {
    final response = await dio.get('/tv/$tvShowID/watch/providers');
    final StreamingProvidersResponse streamingResponse =
        StreamingProvidersResponse.fromJson(response.data);

    String? locale = await Devicelocale.currentLocale;

    List<StreamingProvider> providers = [];
    if (streamingResponse.results.countries[locale?.split('-')[1]]?.flatrate !=
        null) {
      providers = streamingResponse
          .results.countries[locale?.split('-')[1]]!.flatrate!
          .map((movieResult) =>
              StreamingProviderMapper.castToEntity(movieResult))
          .toList();
    }
    return providers;
  }
}
