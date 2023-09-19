import 'package:cinemapp/domain/entities/actors/actor.dart';

abstract class ActorsDatasource {
  Future<List<Actor>> getActorsByMovie(int movieID);
  Future<List<Actor>> getActorsByTvShow(int tvShowID);
}
