import 'package:cinemapp/domain/datasources/actors/actors_datasource.dart';
import 'package:cinemapp/domain/entities/actor.dart';
import 'package:cinemapp/domain/repositories/actors/actors_repositry.dart';

class ActorsdbRepositoryImpl extends ActorsRepository {
  final ActorsDatasource actorsDatasource;

  ActorsdbRepositoryImpl(this.actorsDatasource);

  @override
  Future<List<Actor>> getActorsByMovie(int movieID) {
    return actorsDatasource.getActorsByMovie(movieID);
  }

  @override
  Future<List<Actor>> getActorsByTvShow(int tvShowID) {
    return actorsDatasource.getActorsByTvShow(tvShowID);
  }
}
