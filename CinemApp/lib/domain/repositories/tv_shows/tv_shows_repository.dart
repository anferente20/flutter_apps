import 'package:cinemapp/domain/entities/tv_show.dart';

abstract class TvShowsRepository {
  //* List of TV Shows
  Future<List<TvShow>> getBestRated({int page = 1});

  //* Single TV Show
  Future<TvShow> getTvShowByID(String id);
}
