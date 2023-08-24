import 'package:animate_do/animate_do.dart';
import 'package:cinemapp/config/helpers/human_formats.dart';
import 'package:cinemapp/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class MoviHorizontalListview extends StatefulWidget {
  final List<Movie> movies;
  final String? title;
  final String? subtitle;
  final VoidCallback? loadNextPage;
  final bool showRate;

  const MoviHorizontalListview({
    required this.movies,
    this.title,
    this.subtitle,
    this.loadNextPage,
    this.showRate = true,
    super.key,
  });

  @override
  State<MoviHorizontalListview> createState() => _MoviHorizontalListviewState();
}

class _MoviHorizontalListviewState extends State<MoviHorizontalListview> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (widget.loadNextPage == null) return;
      if (scrollController.position.pixels + 200 >=
          scrollController.position.maxScrollExtent) {
        widget.loadNextPage!();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(children: [
        if (widget.title != null || widget.subtitle != null)
          _Title(
            title: widget.title,
            subtitle: widget.subtitle,
          ),
        Expanded(
            child: ListView.builder(
          controller: scrollController,
          itemCount: widget.movies.length,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return FadeInRight(
              child: _SlideMovie(
                movie: widget.movies[index],
                showRate: widget.showRate,
              ),
            );
          },
        )),
      ]),
    );
  }
}

class _SlideMovie extends StatelessWidget {
  final Movie movie;
  final bool showRate;

  const _SlideMovie({required this.movie, this.showRate = false});

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
              child: Image.network(
                movie.posterPath,
                fit: BoxFit.cover,
                width: 150,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return const Center(
                        child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ));
                  }
                  return FadeInRight(child: child);
                },
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
            child: Row(
              children: [
                Icon(
                  Icons.star_half_outlined,
                  color: Colors.yellow.shade800,
                ),
                const SizedBox(
                  width: 3,
                ),
                Text(
                  '${movie.voteAverage}',
                  style: textStyles.bodyMedium!
                      .copyWith(color: Colors.yellow.shade900),
                ),
                const SizedBox(
                  width: 30,
                ),
                Text(
                  HumanFormats.number(movie.popularity),
                  style: textStyles.bodySmall,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    this.title,
    this.subtitle,
  });

  final String? title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return Container(
      padding: const EdgeInsets.only(top: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (title != null)
            Text(
              title!,
              style: titleStyle,
            ),
          if (subtitle != null)
            FilledButton.tonal(
              style: const ButtonStyle(visualDensity: VisualDensity.compact),
              onPressed: () {},
              child: Text(subtitle!),
            )
        ],
      ),
    );
  }
}