import 'package:flutter/material.dart';

class VideoGradient extends StatelessWidget {
  final List<Color> colors;
  final List<double> stops;

  const VideoGradient(
      {this.colors = const [Colors.transparent, Colors.black87],
      this.stops = const [0.0, 1.0],
      super.key})
      : assert(colors.length == stops.length, 'stops and colors must have same length');

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
        child: DecoratedBox(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: colors,
              stops: stops,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
    ));
  }
}
