import 'package:cinemapp/config/constants/environment.dart';
import 'package:cinemapp/domain/datasources/movies/movies_datasource.dart';
import 'package:cinemapp/domain/entities/movie.dart';
import 'package:cinemapp/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapp/infrastructure/models/moviedb/movies/movie_details.dart';
import 'package:cinemapp/infrastructure/models/moviedb/movies/moviedb_response.dart';
import 'package:dio/dio.dart';

class MoviedbDatasourceImpl extends MoviesDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Enviroment.theMovieDBKey,
        'language': 'es-CO'
      }));

  List<Movie> _jsonToMovies(
      {required Map<String, dynamic> json,
      bool isRecent = false,
      bool isComing = false}) {
    final movieResponse = MovieDBResponse.fromJson(json);

    List<Movie> movies = movieResponse.results
        .map((movieDB) => MovieMapper.movieDBtoEntity(movieDB))
        .toList();
    if (isRecent) {
      DateTime now = DateTime.now();
      DateTime monthAgo = DateTime(now.year, now.month - 2, now.day);
      final List<Movie> isRecentedMovies = movies
          .where((movie) =>
              movie.releaseDate.isAfter(monthAgo) &&
              movie.releaseDate.isBefore(now))
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

  @override
  Future<List<Movie>> getLastMovies({int page = 1}) async {
    final response =
        await dio.get('/movie/now_playing', queryParameters: {'page': page});
    return _jsonToMovies(json: response.data, isRecent: true);
  }

  @override
  Future<List<Movie>> getBestRated({int page = 1}) async {
    final response =
        await dio.get('/movie/top_rated', queryParameters: {'page': page});
    return _jsonToMovies(json: response.data);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response =
        await dio.get('/movie/popular', queryParameters: {'page': page});
    return _jsonToMovies(json: response.data);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    final response =
        await dio.get('/movie/upcoming', queryParameters: {'page': page});
    return _jsonToMovies(json: response.data, isComing: true);
  }

  @override
  Future<Movie> getMovieByID(String id) async {
    final response = await dio.get('/movie/$id');
    if (response.statusCode != 200) {
      throw Exception('Movie with id: $id not found');
    }

    final MovieDetails movieDB = MovieDetails.fromJson(response.data);

    final Movie movie = MovieMapper.movieDetailsToEntity(movieDB);

    return movie;
  }
}
