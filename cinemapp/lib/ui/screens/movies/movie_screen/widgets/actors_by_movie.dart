import 'package:animate_do/animate_do.dart';
import 'package:cinemapp/ui/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ActorsByMovie extends ConsumerWidget {
  const ActorsByMovie({required this.movieID, super.key});

  final int movieID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final actorsByMovie = ref.watch(getActorsProvider);

    if (actorsByMovie[movieID] == null) {
      return const Center(child: CircularProgressIndicator(strokeWidth: 2));
    }
    final actors = actorsByMovie[movieID];

    return SizedBox(
      height: 300,
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
    );
  }
}
