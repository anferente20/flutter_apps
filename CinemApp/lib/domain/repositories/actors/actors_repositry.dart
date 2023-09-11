import 'package:cinemapp/domain/entities/actor.dart';

abstract class ActorsRepository {
  Future<List<Actor>> getActorsByMovie(int movieID);

  Future<List<Actor>> getActorsByTvShow(int tvShowID);
}
