import 'package:flutter/material.dart';

class CustomGradient extends StatelessWidget {
  const CustomGradient({
    super.key,
    required this.stops,
    required this.colors,
    this.begin = Alignment.centerLeft,
    this.end = Alignment.centerRight,
  });
  final AlignmentGeometry begin;
  final AlignmentGeometry end;
  final List<double> stops;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: begin,
            end: end,
            stops: [stops[0], stops[1]],
            colors: [colors[0], colors[0]],
          ),
        ),
      ),
    );
  }
}
