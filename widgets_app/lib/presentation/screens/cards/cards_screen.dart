import 'package:flutter/material.dart';
import 'package:widgets_app/presentation/widgets/cards/custom_border_card.dart';
import 'package:widgets_app/presentation/widgets/cards/custom_card.dart';
import 'package:widgets_app/presentation/widgets/cards/custom_filled_card.dart';
import 'package:widgets_app/presentation/widgets/cards/custom_image_card.dart';

const cards = <Map<String, dynamic>>[
  {'elevation': 0.0, 'label': 'Elevation 0'},
  {'elevation': 1.0, 'label': 'Elevation 1'},
  {'elevation': 2.0, 'label': 'Elevation 2'},
  {'elevation': 3.0, 'label': 'Elevation 3'},
  {'elevation': 4.0, 'label': 'Elevation 4'},
  {'elevation': 5.0, 'label': 'Elevation 5'},
];

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards'),
      ),
      body: const CardsView(),
    );
  }
}

class CardsView extends StatelessWidget {
  const CardsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        ...cards.map((card) => CustomCard(
              elevation: card['elevation'],
              label: card['label'],
            )),
        const SizedBox(
          height: 20,
        ),
        ...cards.map((card) => CustomBoderCard(
              elevation: card['elevation'],
              label: card['label'],
            )),
        const SizedBox(
          height: 20,
        ),
        ...cards.map((card) => CustomFilledCard(
              elevation: card['elevation'],
              label: card['label'],
            )),
        const SizedBox(
          height: 20,
        ),
        ...cards.map((card) => CustomImageCard(
              elevation: card['elevation'],
              label: card['label'],
            )),
        const SizedBox(
          height: 50,
        )
      ]),
    );
  }
}
