import 'package:cinemapp/config/constants/images.dart';
import 'package:cinemapp/domain/entities/movie.dart';
import 'package:cinemapp/infrastructure/models/moviedb/movie_movidb.dart';

class MovieMapper {
  static Movie movieDBtoEntity(MovieMovieDB movieDB) => Movie(
      adult: movieDB.adult,
      backdropPath: movieDB.backdropPath != ''
          ? 'https://image.tmdb.org/t/p/w500${movieDB.backdropPath}'
          : Images.posterNotFound,
      genreIds: movieDB.genreIds.map((e) => e.toString()).toList(),
      id: movieDB.id,
      originalLanguage: movieDB.originalLanguage,
      originalTitle: movieDB.originalTitle,
      overview: movieDB.overview,
      popularity: movieDB.popularity,
      posterPath: movieDB.posterPath != ''
          ? 'https://image.tmdb.org/t/p/w500${movieDB.posterPath}'
          : Images.posterNotFound,
      releaseDate: movieDB.releaseDate,
      title: movieDB.title,
      video: movieDB.video,
      voteAverage: movieDB.voteAverage,
      voteCount: movieDB.voteCount);
}
