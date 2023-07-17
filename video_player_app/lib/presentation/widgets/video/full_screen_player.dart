import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_app/presentation/widgets/video/video_gradient.dart';

class FullScreenPlayer extends StatefulWidget {
  final String videoUrl;
  final String caption;
  const FullScreenPlayer({super.key, required this.videoUrl, required this.caption});

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset(widget.videoUrl)
      ..setVolume(0)
      ..setLooping(true)
      ..play();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: controller.initialize(),
        builder: (context, snapshot) {
          return snapshot.connectionState != ConnectionState.done
              ? const Center(child: CircularProgressIndicator(strokeWidth: 2))
              : AspectRatio(
                  aspectRatio: controller.value.aspectRatio,
                  child: Stack(
                    children: [
                      GestureDetector(
                          onTap: () {
                            controller.value.isPlaying ? controller.pause() : controller.play();
                          },
                          child: VideoPlayer(controller)),
                      VideoGradient(
                        stops: const [0.8, 1.0],
                      ),
                      Positioned(
                          left: 20,
                          bottom: 50,
                          child: _VideoCaption(
                            caption: widget.caption,
                          ))
                    ],
                  ));
        });
  }
}

class _VideoCaption extends StatelessWidget {
  final String caption;
  const _VideoCaption({super.key, required this.caption});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return SizedBox(
      width: size.width * 0.6,
      child: Text(caption, maxLines: 2, style: titleStyle),
    );
  }
}
