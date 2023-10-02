import 'dart:io';

import 'package:cinemapp/config/helpers/human_formats.dart';
import 'package:cinemapp/domain/entities/movies/movie.dart';
import 'package:cinemapp/ui/screens/movies/widgets/actors_by_movie.dart';
import 'package:cinemapp/ui/screens/movies/widgets/streaming_providers_by_movie.dart';
import 'package:cinemapp/ui/widgets/shared/movies/popularity/popularity.dart';
import 'package:cinemapp/ui/widgets/videos/video_from_movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key, required this.movie, this.isMovie = true});

  final Movie movie;
  final bool isMovie;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textStyles = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  height: 220,
                  width: size.width * 0.3,
                  fit: BoxFit.cover,
                  placeholder: const AssetImage('assets/loaders/bottle-loader.gif'),
                  image: NetworkImage(movie.posterPath),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: size.width * 0.7 - 50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: textStyles.titleLarge,
                    ),
                    Text(
                      movie.overview,
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 10),
                    Popularity(popularity: movie.voteAverage),
                    Row(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.premiere,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 5),
                        Text(HumanFormats.shortDate(movie.releaseDate, Platform.localeName))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Wrap(
            children: [
              ...movie.genreIds.map(
                (genre) => Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: Chip(
                    label: Text(genre),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ActorsByMovie(
          movieID: movie.id,
          isMovie: isMovie,
        ),
        StreamingProvidersByMovie(
          movieID: movie.id,
          isMovie: isMovie,
        ),
        VideosFromMovie(
          movieId: movie.id,
          isMovie: isMovie,
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
