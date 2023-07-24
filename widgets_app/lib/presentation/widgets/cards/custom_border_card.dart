import 'package:flutter/material.dart';

class CustomBoderCard extends StatelessWidget {
  const CustomBoderCard({required this.elevation, required this.label, super.key});

  final String label;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
        elevation: elevation,
        shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            side: BorderSide(color: colors.outline)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
          child: Column(children: [
            Align(
                alignment: Alignment.topRight,
                child: IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert_rounded))),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text('$label - outline'),
            )
          ]),
        ));
  }
}
