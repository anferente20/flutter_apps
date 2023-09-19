import 'package:animate_do/animate_do.dart';
import 'package:cinemapp/domain/entities/movies/movie.dart';
import 'package:cinemapp/ui/widgets/shared/gradients/custom_gradient.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomSliverAppbar extends StatelessWidget {
  const CustomSliverAppbar({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: size.height * 0.7,
      foregroundColor: Colors.white,
      leading: IconButton(
        onPressed: () => context.pop(),
        icon: const Icon(
          Icons.arrow_back_ios_new_outlined,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.favorite_border_outlined),
          // icon: Icon(
          //   Icons.favorite_outlined,
          //   color: Colors.redAccent,
          // ),
        )
      ],
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        background: Stack(
          children: [
            SizedBox.expand(
              child: Image.network(
                movie.posterPath,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) return const SizedBox();
                  return FadeIn(child: child);
                },
              ),
            ),
            const CustomGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.7, 1],
              colors: [Colors.transparent, Colors.black87],
            ),
            const CustomGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.0, 0.2],
              colors: [Colors.black87, Colors.transparent],
            ),
            const CustomGradient(
              begin: Alignment.topRight,
              stops: [0.0, 0.4],
              colors: [Colors.black87, Colors.transparent],
            ),
          ],
        ),
      ),
    );
  }
}
