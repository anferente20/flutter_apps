import 'package:cinemapp/domain/entities/actors.dart';

abstract class ActorsRepository {
  Future<List<Actor>> getActorsByMovie(int movieID);
}
