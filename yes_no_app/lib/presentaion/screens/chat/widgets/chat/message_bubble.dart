import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class MessageBubble extends StatelessWidget {
  final bool isLeftMessage;
  final Message message;
  final String? image;

  const MessageBubble({required this.message, this.image, this.isLeftMessage = false, super.key});

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
          child: Text(
            message.text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(height: isLeftMessage ? 5 : 10),
        Visibility(visible: isLeftMessage, child: _ImageBubble(image: image)),
        Visibility(visible: isLeftMessage, child: const SizedBox(height: 10)),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String? image;
  const _ImageBubble({required this.image});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          image!,
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
