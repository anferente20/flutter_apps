import 'package:animate_do/animate_do.dart';
import 'package:cinemapp/ui/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StreamingProvidersByMovie extends ConsumerWidget {
  const StreamingProvidersByMovie(
      {required this.movieID, this.isMovie = true, super.key});

  final int movieID;
  final bool isMovie;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).textTheme;
    final streamingProvidersByMovie = ref.watch(getStreamingProvidersProvider);
    final streamingProvidersByTvShow =
        ref.watch(getTvShowStreamingProvidersProvider);

    if (streamingProvidersByMovie[movieID] == null &&
        streamingProvidersByTvShow[movieID] == null) {
      return const Center(child: CircularProgressIndicator(strokeWidth: 2));
    }

    final providers = isMovie
        ? streamingProvidersByMovie[movieID]
        : streamingProvidersByTvShow[movieID];

    return Visibility(
      visible: providers!.isNotEmpty,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.whereToWatch,
              style: textStyle.titleLarge,
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: providers.length,
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
                              providers[index].logo,
                              height: 135,
                              width: 135,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Text(
                            providers[index].name,
                            maxLines: 2,
                            style: textStyle.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
