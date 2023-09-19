import 'package:cinemapp/config/constants/environment.dart';
import 'package:cinemapp/domain/datasources/search/search_datasource.dart';
import 'package:cinemapp/domain/entities/movies/movie.dart';
import 'package:cinemapp/domain/entities/tv_shows/tv_show.dart';
import 'package:cinemapp/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapp/infrastructure/models/moviedb/movies/moviedb_response.dart';
import 'package:dio/dio.dart';

class SearchDatasourceImpl extends SearchDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {'api_key': Enviroment.theMovieDBKey, 'language': 'es-CO'},
    ),
  );

  List<Movie> _jsonToMovies(
      {required Map<String, dynamic> json, bool isRecent = false, bool isComing = false}) {
    final movieResponse = MovieDBResponse.fromJson(json);

    List<Movie> movies =
        movieResponse.results.map((movieDB) => MovieMapper.movieDBtoEntity(movieDB)).toList();
    if (isRecent) {
      DateTime now = DateTime.now();
      DateTime monthAgo = DateTime(now.year, now.month - 2, now.day);
      final List<Movie> isRecentedMovies = movies
          .where((movie) => movie.releaseDate.isAfter(monthAgo) && movie.releaseDate.isBefore(now))
          .toList();
      movies = isRecentedMovies;
    }

    if (isComing) {
      DateTime now = DateTime.now();
      final List<Movie> isRecentedMovies =
          movies.where((movie) => movie.releaseDate.isAfter(now)).toList();
      movies = isRecentedMovies;
    }

    return movies;
  }

  List<TvShow> _jsonToTvShows(
    Map<String, dynamic> json,
  ) {
    final movieResponse = MovieDBResponse.fromJson(json);

    List<TvShow> movies =
        movieResponse.results.map((movieDB) => MovieMapper.movieDBtoTvShowEntity(movieDB)).toList();

    return movies;
  }

  @override
  Future<List<Movie>> searchMovies(String query) async {
    if (query.length >= 3) {
      final response = await dio.get('/search/movie', queryParameters: {'query': query});
      return _jsonToMovies(json: response.data);
    }
    return [];
  }

  @override
  Future<List<TvShow>> searchTvShows(String query) async {
    if (query.length >= 3) {
      final response = await dio.get('/search/tv', queryParameters: {'query': query});
      return _jsonToTvShows(response.data);
    }
    return [];
  }
}
