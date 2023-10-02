import 'package:cinemapp/config/constants/environment.dart';
import 'package:cinemapp/domain/datasources/tv_shows/tv_shows_datasource.dart';
import 'package:cinemapp/domain/entities/tv_shows/tv_show.dart';
import 'package:cinemapp/domain/entities/video/video.dart';
import 'package:cinemapp/infrastructure/mappers/movie/movie_mapper.dart';
import 'package:cinemapp/infrastructure/mappers/tv_shows/tv_show_mapper.dart';
import 'package:cinemapp/infrastructure/mappers/video/video_mapper.dart';
import 'package:cinemapp/infrastructure/models/moviedb/movies/moviedb_response.dart';
import 'package:cinemapp/infrastructure/models/moviedb/tv_shows/tv_shows_details.dart';
import 'package:cinemapp/infrastructure/models/moviedb/video/movie_video_response.dart';
import 'package:dio/dio.dart';

class TvShowsDatasourceImpl extends TvShowsDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {'api_key': Enviroment.theMovieDBKey, 'language': 'es-CO'},
    ),
  );

  @override
  Future<List<TvShow>> getBestRated({int page = 1}) async {
    final response = await dio.get('/tv/top_rated', queryParameters: {'page': page});

    return _jsonToMovies(response.data);
  }

  @override
  Future<TvShow> getTvShowByID(String id) async {
    final response = await dio.get('/tv/$id');
    if (response.statusCode != 200) {
      throw Exception('Movie with id: $id not found');
    }

    final TvShowDetails tvShowDB = TvShowDetails.fromJson(response.data);

    final TvShow tvShow = TvShowMapper.tvShowDBtoEntity(tvShowDB);
    return tvShow;
  }

  List<TvShow> _jsonToMovies(
    Map<String, dynamic> json,
  ) {
    final movieResponse = MovieDBResponse.fromJson(json);

    List<TvShow> movies =
        movieResponse.results.map((movieDB) => MovieMapper.movieDBtoTvShowEntity(movieDB)).toList();

    return movies;
  }

  @override
  Future<List<Video>> getYoutubeVideosById(int movieId) async {
    final response = await dio.get('/tv/$movieId/videos');
    final moviedbVideosReponse = MoviedbVideosResponse.fromJson(response.data);
    final videos = <Video>[];

    for (final moviedbVideo in moviedbVideosReponse.results) {
      if (moviedbVideo.site == 'YouTube') {
        final video = VideoMapper.moviedbVideoToEntity(moviedbVideo);
        videos.add(video);
      }
    }

    return videos;
  }

  @override
  Future<List<TvShow>> getSimilarShows(int movieId) async {
    final response = await dio.get('/tv/$movieId/similar');
    return _jsonToMovies(response.data);
  }
}
