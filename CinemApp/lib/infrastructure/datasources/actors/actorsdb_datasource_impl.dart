import 'package:cinemapp/config/constants/environment.dart';
import 'package:cinemapp/domain/datasources/actors/actors_datasource.dart';
import 'package:cinemapp/domain/entities/actors/actor.dart';
import 'package:cinemapp/infrastructure/mappers/actor_mapper.dart';
import 'package:cinemapp/infrastructure/models/moviedb/actors/credits_response.dart';
import 'package:dio/dio.dart';

class ActorsdbDatasourceImpl extends ActorsDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {'api_key': Enviroment.theMovieDBKey, 'language': 'es-CO'},
    ),
  );

  @override
  Future<List<Actor>> getActorsByMovie(int movieID) async {
    final response = await dio.get('/movie/$movieID/credits');
    final CreditsResponse creditsResponse = CreditsResponse.fromJson(response.data);
    List<Actor> actors =
        creditsResponse.cast.map((cast) => ActorMapper.castToEntity(cast)).toList();
    return actors;
  }

  @override
  Future<List<Actor>> getActorsByTvShow(int tvShowID) async {
    final response = await dio.get('/tv/$tvShowID/credits');
    final CreditsResponse creditsResponse = CreditsResponse.fromJson(response.data);
    List<Actor> actors =
        creditsResponse.cast.map((cast) => ActorMapper.castToEntity(cast)).toList();
    return actors;
  }
}
