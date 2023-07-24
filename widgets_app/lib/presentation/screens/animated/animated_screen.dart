import 'package:flutter/material.dart';
import 'dart:math' show Random;

class AnimatedScreen extends StatefulWidget {
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 50;
  double height = 50;
  Color color = Colors.redAccent;
  double borderRadius = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.play_arrow_rounded), onPressed: () => changeShape()),
      body: Center(
          child: AnimatedContainer(
        height: height <= 0 ? 0 : height,
        width: width <= 0 ? 0 : width,
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(borderRadius)),
        duration: const Duration(milliseconds: 500),
        curve: Curves.elasticOut,
      )),
    );
  }

  void changeShape() {
    final random = Random();
    setState(() {
      width = random.nextInt(300) + 80;
      height = random.nextInt(300) + 80;
      borderRadius = random.nextInt(100) + 20;
      color = Color.fromRGBO(random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
    });
  }
}
