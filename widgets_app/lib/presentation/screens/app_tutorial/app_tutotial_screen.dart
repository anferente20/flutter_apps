import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/utils/models/slide_info.dart';
import 'package:widgets_app/presentation/widgets/slides/custom_slide.dart';

final slides = <SlideInfo>[
  SlideInfo(
      'Busca la comida',
      'Veniam est commodo aliquip tempor sint dolor id est cupidatat aliqua incididunt.',
      'assets/Images/1.png'),
  SlideInfo(
      'Entrega rápida',
      'Ea id sint laboris ad proident anim consectetur velit pariatur eiusmod nulla.',
      'assets/Images/2.png'),
  SlideInfo('Disfruta la comida',
      'Amet est magna adipisicing labore id sint velit est reprehenderit.', 'assets/Images/3.png'),
];

class AppTutorialScreen extends StatefulWidget {
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageController = PageController();
  bool isLastSlide = false;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      final page = pageController.page ?? 0;
      if (!isLastSlide && page >= (slides.length - 1.5)) {
        setState(() {
          isLastSlide = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          physics: const BouncingScrollPhysics(),
          controller: pageController,
          children: slides.map((slideData) => CustomSlide(slide: slideData)).toList(),
        ),
        Positioned(
            top: 60,
            right: 20,
            child: TextButton(
              child: const Text('Saltar'),
              onPressed: () => context.pop(),
            )),
        Visibility(
          visible: isLastSlide,
          child: Positioned(
              right: 20,
              bottom: 60,
              child: FadeInRight(
                from: 15,
                delay: const Duration(seconds: 1),
                child: FilledButton(
                  child: const Text('Comenzar'),
                  onPressed: () => context.pop(),
                ),
              )),
        ),
      ],
    ));
  }
}
