import 'package:flutter/material.dart';

class CustomFilledCard extends StatelessWidget {
  const CustomFilledCard({required this.elevation, required this.label, super.key});

  final String label;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
        color: colors.surfaceVariant,
        elevation: elevation,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
          child: Column(children: [
            Align(
                alignment: Alignment.topRight,
                child: IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert_rounded))),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text('$label - filled'),
            )
          ]),
        ));
  }
}
