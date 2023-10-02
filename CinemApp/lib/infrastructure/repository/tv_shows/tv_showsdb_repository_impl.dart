import 'package:cinemapp/domain/datasources/tv_shows/tv_shows_datasource.dart';
import 'package:cinemapp/domain/entities/tv_shows/tv_show.dart';
import 'package:cinemapp/domain/entities/video/video.dart';
import 'package:cinemapp/domain/repositories/tv_shows/tv_shows_repository.dart';

class TvShowsdbRepositoryImpl extends TvShowsRepository {
  final TvShowsDatasource tvShowsDatasource;
  TvShowsdbRepositoryImpl(this.tvShowsDatasource);

  @override
  Future<List<TvShow>> getBestRated({int page = 1}) {
    return tvShowsDatasource.getBestRated(page: page);
  }

  @override
  Future<TvShow> getTvShowByID(String id) {
    return tvShowsDatasource.getTvShowByID(id);
  }

  @override
  Future<List<Video>> getYoutubeVideosById(int movieId) {
    return tvShowsDatasource.getYoutubeVideosById(movieId);
  }
}
