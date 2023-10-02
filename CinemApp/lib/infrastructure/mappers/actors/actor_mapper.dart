import 'package:cinemapp/config/constants/images.dart';
import 'package:cinemapp/domain/entities/actors/actor.dart';
import 'package:cinemapp/infrastructure/models/moviedb/actors/credits_response.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) => Actor(
        id: cast.id,
        name: cast.name,
        profilePath: cast.profilePath != null
            ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}'
            : Images.profileNotFound,
        character: cast.character,
      );
}
