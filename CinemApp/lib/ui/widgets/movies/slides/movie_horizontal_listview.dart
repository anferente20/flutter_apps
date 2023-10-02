import 'package:animate_do/animate_do.dart';
import 'package:cinemapp/domain/entities/movies/movie.dart';
import 'package:cinemapp/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      if (scrollController.position.pixels + 200 >= scrollController.position.maxScrollExtent) {
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
          MovieTitle(
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
            return GestureDetector(
              onTap: () {
                if (widget.movies[index].isMovie) {
                  context.push('/home/0/movie/${widget.movies[index].id}');
                } else {
                  context.push('/home/0/tv-show/${widget.movies[index].id}');
                }
              },
              child: FadeInRight(
                child: MovieSlide(
                  movie: widget.movies[index],
                  showRate: widget.showRate,
                ),
              ),
            );
          },
        )),
      ]),
    );
  }
}
