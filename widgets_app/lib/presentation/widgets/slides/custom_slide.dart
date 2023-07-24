import 'package:flutter/material.dart';
import 'package:widgets_app/config/utils/models/slide_info.dart';

class CustomSlide extends StatelessWidget {
  const CustomSlide({required this.slide, super.key});

  final SlideInfo slide;

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final bodyStyle = Theme.of(context).textTheme.bodySmall;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              slide.imageUrl,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              slide.title,
              style: titleStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              slide.caption,
              style: bodyStyle,
            )
          ],
        ),
      ),
    );
  }
}
