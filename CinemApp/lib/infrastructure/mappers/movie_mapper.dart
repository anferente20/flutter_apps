import 'package:cinemapp/config/constants/images.dart';
import 'package:cinemapp/domain/entities/movies/movie.dart';
import 'package:cinemapp/domain/entities/tv_shows/tv_show.dart';
import 'package:cinemapp/infrastructure/models/moviedb/movies/movie_moviedb.dart';
import 'package:cinemapp/infrastructure/models/moviedb/movies/movie_details.dart';

class MovieMapper {
  static Movie movieDBtoEntity(MovieMovieDB movieDB) => Movie(
        adult: movieDB.adult,
        backdropPath: movieDB.backdropPath != ''
            ? 'https://image.tmdb.org/t/p/w500${movieDB.backdropPath}'
            : Images.posterNotFound,
        genreIds: movieDB.genreIds.map((e) => e.toString()).toList(),
        id: movieDB.id,
        originalLanguage: movieDB.originalLanguage,
        originalTitle: movieDB.originalTitle!,
        overview: movieDB.overview,
        popularity: movieDB.popularity,
        posterPath: movieDB.posterPath != ''
            ? 'https://image.tmdb.org/t/p/w500${movieDB.posterPath}'
            : Images.posterNotFound,
        releaseDate: movieDB.releaseDate!,
        title: movieDB.title,
        video: movieDB.video,
        voteAverage: movieDB.voteAverage,
        voteCount: movieDB.voteCount,
        isMovie: true,
      );

  static TvShow movieDBtoTvShowEntity(MovieMovieDB movieDB) => TvShow(
        adult: movieDB.adult,
        backdropPath: movieDB.backdropPath != ''
            ? 'https://image.tmdb.org/t/p/w500${movieDB.backdropPath}'
            : Images.posterNotFound,
        genreIds: movieDB.genreIds.map((e) => e.toString()).toList(),
        id: movieDB.id,
        originalLanguage: movieDB.originalLanguage,
        originalTitle: movieDB.originalTitle!,
        overview: movieDB.overview,
        popularity: movieDB.popularity,
        posterPath: movieDB.posterPath != ''
            ? 'https://image.tmdb.org/t/p/w500${movieDB.posterPath}'
            : Images.posterNotFound,
        releaseDate: movieDB.releaseDate!,
        title: movieDB.name,
        video: movieDB.video,
        voteAverage: movieDB.voteAverage,
        voteCount: movieDB.voteCount,
        isMovie: false,
      );

  static Movie movieDetailsToEntity(MovieDetails moviedb) => Movie(
        adult: moviedb.adult,
        backdropPath: (moviedb.backdropPath != '')
            ? 'https://image.tmdb.org/t/p/w500${moviedb.backdropPath}'
            : Images.posterNotFound,
        genreIds: moviedb.genres.map((e) => e.name).toList(),
        id: moviedb.id,
        originalLanguage: moviedb.originalLanguage,
        originalTitle: moviedb.originalTitle,
        overview: moviedb.overview,
        popularity: moviedb.popularity,
        posterPath: (moviedb.posterPath != '')
            ? 'https://image.tmdb.org/t/p/w500${moviedb.posterPath}'
            : Images.posterNotFound,
        releaseDate: moviedb.releaseDate,
        title: moviedb.title,
        video: moviedb.video,
        voteAverage: moviedb.voteAverage,
        voteCount: moviedb.voteCount,
        isMovie: true,
      );
}
