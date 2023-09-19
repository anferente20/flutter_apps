import 'package:flutter/material.dart';
import 'package:cinemapp/domain/entities/movies/movie.dart';

abstract class LocalStorageDatasource {
  //** get Favorites info */
  Future<void> toggleFavorite(Movie movie);
  Future<bool> isMovieFavorite(int moviId);
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0});

  //** get theme info */
  Future<bool> isDarkMode();
  Future<Color> getColorSchema();
}
