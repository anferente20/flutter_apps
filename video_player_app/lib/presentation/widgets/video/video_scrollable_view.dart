import 'package:flutter/material.dart';
import 'package:video_player_app/domain/entities/video_post.dart';
import 'package:video_player_app/presentation/widgets/video/full_screen_player.dart';
import 'package:video_player_app/presentation/widgets/buttons/video_buttons.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableView({required this.videos, super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final video = videos[index];
        return Stack(
          children: [
            SizedBox.expand(
                child: FullScreenPlayer(
              caption: video.caption,
              videoUrl: video.videoUrl,
            )),
            Positioned(bottom: 40, right: 20, child: VideoButtons(video: video))
          ],
        );
      },
    );
  }
}
