import 'package:cinemapp/domain/entities/movies/movie.dart';
import 'package:cinemapp/domain/entities/tv_shows/tv_show.dart';
import 'package:cinemapp/ui/widgets/movies/poster/movie_poster_link.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MoviesMasonryGridState extends StatefulWidget {
  final List<Movie> movies;
  final VoidCallback? loadNextPage;

  const MoviesMasonryGridState({
    required this.movies,
    this.loadNextPage,
  });

  @override
  State<MoviesMasonryGridState> createState() => _MoviesMasonryGridStateState();
}

class _MoviesMasonryGridStateState extends State<MoviesMasonryGridState> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: MasonryGridView.count(
        crossAxisCount: 3,
        itemCount: widget.movies.length,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        itemBuilder: (context, index) {
          if (index == 1) {
            return Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                MoviePosterLink(
                  movie: widget.movies[index],
                )
              ],
            );
          }
          return MoviePosterLink(
            movie: widget.movies[index],
          );
        },
      ),
    );
  }
}
