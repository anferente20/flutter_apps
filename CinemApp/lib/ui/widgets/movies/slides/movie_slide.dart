import 'package:animate_do/animate_do.dart';
import 'package:cinemapp/domain/entities/movies/movie.dart';
import 'package:cinemapp/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class MovieSlide extends StatelessWidget {
  final Movie movie;
  final bool showRate;

  const MovieSlide({
    super.key,
    required this.movie,
    this.showRate = false,
  });

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //* Image
          SizedBox(
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                height: 220,
                fit: BoxFit.cover,
                placeholder: const AssetImage('assets/loaders/bottle-loader.gif'),
                image: NetworkImage(movie.posterPath),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          //* Title
          SizedBox(
            width: 150,
            child: Text(
              movie.title,
              maxLines: 2,
              style: textStyles.titleSmall,
            ),
          ),
          //* rated
          Visibility(
            visible: showRate,
            child: Popularity(
              popularity: movie.voteAverage,
            ),
          )
        ],
      ),
    );
  }
}
