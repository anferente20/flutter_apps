import 'package:animate_do/animate_do.dart';
import 'package:cinemapp/domain/entities/movie.dart';
import 'package:cinemapp/ui/widgets/shared/movies/popularity/popularity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchResultItem extends StatelessWidget {
  const SearchResultItem({
    required this.item,
    required this.isTvShow,
    required this.onMovieSelected,
    super.key,
  });

  final Movie item;
  final bool isTvShow;
  final Function(Movie) onMovieSelected;

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        onMovieSelected;
        if (isTvShow) {
          context.push('/tv-show/${item.id}');
        } else {
          context.push('/movie/${item.id}');
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(children: [
          SizedBox(
            width: size.width * 0.2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                item.posterPath,
                loadingBuilder: (context, child, loadingProgress) => FadeIn(child: child),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: size.width * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: textStyles.titleMedium,
                ),
                Text(
                  item.overview,
                  style: textStyles.bodySmall,
                  maxLines: 4,
                  overflow: TextOverflow.fade,
                ),
                Poipularity(
                  popularity: item.voteAverage,
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
