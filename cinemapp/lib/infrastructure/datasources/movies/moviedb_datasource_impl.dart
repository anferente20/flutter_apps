import 'package:cinemapp/config/constants/environment.dart';
import 'package:cinemapp/domain/datasources/movies/movies_datasource.dart';
import 'package:cinemapp/domain/entities/movie.dart';
import 'package:cinemapp/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapp/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';

class MoviedbDatasourceImpl extends MoviesDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Enviroment.theMovieDBKey,
        'language': 'es-CO'
      }));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing');
    final movieResponse = MovieDBResponse.fromJson(response.data);

    final List<Movie> movies = _getMoviesFromResponse(movieResponse);

    return movies;
  }

  List<Movie> _getMoviesFromResponse(MovieDBResponse movieResponse) {
    return movieResponse.results
        .map((movieDB) => MovieMapper.movieDBtoEntity(movieDB))
        .toList();
  }
}
