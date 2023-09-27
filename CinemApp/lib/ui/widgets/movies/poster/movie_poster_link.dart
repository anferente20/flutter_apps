import 'package:animate_do/animate_do.dart';
import 'package:cinemapp/domain/entities/movies/movie.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MoviePosterLink extends StatelessWidget {
  final Movie movie;

  const MoviePosterLink({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (movie.isMovie) {
          context.push('/home/0/movie/${movie.id}');
        } else {
          context.push('/home/0/tv-show/${movie.id}');
        }
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: FadeIn(child: Image.network(movie.posterPath)),
      ),
    );
  }
}
