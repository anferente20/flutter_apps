import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final bool isLeftMessage;

  const MessageBubble({this.isLeftMessage = false, super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: isLeftMessage ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          decoration: BoxDecoration(
              color: isLeftMessage ? colors.secondary : colors.primary,
              borderRadius: BorderRadius.circular(20)),
          child: const Text(
            'Id reprehenderit qui ',
            style: TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(height: isLeftMessage ? 5 : 10),
        Visibility(visible: isLeftMessage, child: _ImageBubble()),
        Visibility(visible: isLeftMessage, child: SizedBox(height: 10)),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  const _ImageBubble();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          'https://yesno.wtf/assets/yes/10-271c872c91cd72c1e38e72d2f8eda676.gif',
          width: size.width * 0.7,
          height: 150,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return Container(
              width: size.width * 0.7,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: const Text("Coneja está escribiendo"),
            );
          },
        ));
  }
}
