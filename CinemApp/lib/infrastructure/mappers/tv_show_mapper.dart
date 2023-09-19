import 'package:cinemapp/config/constants/images.dart';
import 'package:cinemapp/domain/entities/tv_shows/tv_show.dart';
import 'package:cinemapp/infrastructure/models/moviedb/tv_shows/tv_shows_details.dart';

class TvShowMapper {
  static TvShow tvShowDBtoEntity(TvShowDetails tvShowDB) => TvShow(
        adult: tvShowDB.adult,
        backdropPath: tvShowDB.backdropPath != ''
            ? 'https://image.tmdb.org/t/p/w500${tvShowDB.backdropPath}'
            : Images.posterNotFound,
        genreIds: tvShowDB.genres.map((e) => e.name).toList(),
        id: tvShowDB.id,
        originalLanguage: tvShowDB.originalLanguage,
        originalTitle: tvShowDB.originalName,
        overview: tvShowDB.overview,
        popularity: tvShowDB.popularity,
        posterPath: tvShowDB.backdropPath != ''
            ? 'https://image.tmdb.org/t/p/w500${tvShowDB.posterPath}'
            : Images.posterNotFound,
        releaseDate: tvShowDB.firstAirDate,
        title: tvShowDB.name,
        video: false,
        voteAverage: tvShowDB.voteAverage,
        voteCount: tvShowDB.voteCount,
      );
}
