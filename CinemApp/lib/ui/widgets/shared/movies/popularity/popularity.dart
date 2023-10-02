import 'package:cinemapp/config/helpers/human_formats.dart';
import 'package:flutter/material.dart';

class Popularity extends StatelessWidget {
  const Popularity({
    super.key,
    required this.popularity,
  });

  final double popularity;

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    return Row(
      children: [
        if (popularity > 0)
          Icon(
            Icons.star_half_outlined,
            color: Colors.yellow.shade800,
          ),
        if (popularity > 0)
          const SizedBox(
            width: 3,
          ),
        if (popularity > 0)
          Text(
            HumanFormats.number(popularity, 1),
            style: textStyles.bodyMedium!.copyWith(color: Colors.yellow.shade900),
          ),
      ],
    );
  }
}
