import 'package:cinemapp/domain/entities/actors.dart';

abstract class ActorsDatasource {
  Future<List<Actor>> getActorsByMovie(int movieID);
}
