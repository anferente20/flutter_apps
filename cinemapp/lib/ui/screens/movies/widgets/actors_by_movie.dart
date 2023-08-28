import 'package:animate_do/animate_do.dart';
import 'package:cinemapp/ui/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ActorsByMovie extends ConsumerWidget {
  const ActorsByMovie({required this.movieID, this.isMovie = true, super.key});

  final int movieID;
  final bool isMovie;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final actorsByMovie = ref.watch(getActorsByMovieProvider);
    final actorsByTvShow = ref.watch(getActorsByTvShowProvider);

    if (actorsByMovie[movieID] == null && actorsByTvShow[movieID] == null) {
      return const Center(child: CircularProgressIndicator(strokeWidth: 2));
    }
    print(actorsByMovie[movieID]);
    print(isMovie);
    print(actorsByTvShow[movieID]);
    final actors = isMovie ? actorsByMovie[movieID] : actorsByTvShow[movieID];
    print(actors);

    final textStyle = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.actors,
            style: textStyle.titleLarge,
          ),
          SizedBox(
            height: 290,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: actors!.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(8),
                  width: 135,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeInRight(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            actors[index].profilePath,
                            height: 180,
                            width: 135,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        actors[index].name,
                        maxLines: 2,
                      ),
                      Text(
                        actors[index].character!,
                        maxLines: 2,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
