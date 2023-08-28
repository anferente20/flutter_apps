import 'package:cinemapp/config/constants/environment.dart';
import 'package:cinemapp/domain/datasources/actors/actors_datasource.dart';
import 'package:cinemapp/domain/entities/actors.dart';
import 'package:dio/dio.dart';

class ActorsdbDatasourceImpl extends ActorsDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Enviroment.theMovieDBKey,
        'language': 'es-CO'
      }));
  @override
  Future<List<Actor>> getActorsByMovie(String movieID) async {
    final response = await dio.get('/movie/$movieID/credits');
  }
}
