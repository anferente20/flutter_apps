import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player_app/features/video_post/provider/video_post_provider.dart';
import 'package:video_player_app/presentation/widgets/video/video_scrollable_view.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPostProvider = context.watch<VideoPostProvider>();

    return Scaffold(
        body: videoPostProvider.initialLoading
            ? const Center(
                child: CircularProgressIndicator(
                strokeWidth: 2,
              ))
            : VideoScrollableView(videos: videoPostProvider.videos));
  }
}
