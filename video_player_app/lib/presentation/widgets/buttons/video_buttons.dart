import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:video_player_app/domain/entities/video_post.dart';
import 'package:video_player_app/shared/helpers/formatter.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost video;
  const VideoButtons({required this.video, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _CustomIconButton(value: video.likes, icon: Icons.favorite),
      const SizedBox(height: 20),
      _CustomIconButton(value: video.views, icon: Icons.remove_red_eye_outlined),
      const SizedBox(height: 20),
      SpinPerfect(
          infinite: true,
          duration: const Duration(seconds: 5),
          child: const _CustomIconButton(value: 0, icon: Icons.play_circle_outline))
    ]);
  }
}

class _CustomIconButton extends StatelessWidget {
  final int value;
  final IconData icon;
  final Color? color;
  const _CustomIconButton({required this.value, required this.icon, iconColor})
      : color = iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      IconButton(
        onPressed: () {},
        icon: Icon(icon),
        color: color,
        iconSize: 30,
      ),
      Visibility(
          visible: value > 0, child: Text(Formatter.humanReadableNumberFormatter(value.toDouble())))
    ]);
  }
}
