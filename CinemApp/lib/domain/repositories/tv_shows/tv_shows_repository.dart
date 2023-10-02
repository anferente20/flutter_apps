import 'package:cinemapp/domain/entities/tv_shows/tv_show.dart';
import 'package:cinemapp/domain/entities/video/video.dart';

abstract class TvShowsRepository {
  //* List of TV Shows
  Future<List<TvShow>> getBestRated({int page = 1});
  Future<List<TvShow>> getSimilarShows(int movieId);

  //* Single TV Show
  Future<TvShow> getTvShowByID(String id);
  Future<List<Video>> getYoutubeVideosById(int movieId);
}
