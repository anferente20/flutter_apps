import 'package:cinemapp/domain/entities/movie.dart';
import 'package:cinemapp/ui/providers/movies/movie_info_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieScreen extends ConsumerStatefulWidget {
  static const path = '/movie/';
  final String movieID;

  const MovieScreen({required this.movieID, super.key});

  @override
  ConsumerState<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends ConsumerState<MovieScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(movieInfoProvider.notifier).loadMovie(widget.movieID);
  }

  @override
  Widget build(BuildContext context) {
    final Movie? movie = ref.watch(movieInfoProvider)[widget.movieID];

    if (movie == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      );
    }

    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [_CustomSliverAppbar(movie: movie)],
      ),
    );
  }
}

class _CustomSliverAppbar extends StatelessWidget {
  const _CustomSliverAppbar({required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: size.height * 0.7,
      foregroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        background: _MovieView(
          movie: movie,
        ),
        title: Text(
          movie.title,
          style: const TextStyle(fontSize: 20),
          textAlign: TextAlign.start,
        ),
      ),
    );
  }
}

class _MovieView extends StatelessWidget {
  const _MovieView({required this.movie});
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox.expand(
          child: Image.network(
            movie.posterPath,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox.expand(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.7, 1],
                colors: [Colors.transparent, Colors.black87],
              ),
            ),
          ),
        ),
        const SizedBox.expand(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                stops: [0.0, 0.4],
                colors: [Colors.black87, Colors.transparent],
              ),
            ),
          ),
        )
      ],
    );
  }
}
