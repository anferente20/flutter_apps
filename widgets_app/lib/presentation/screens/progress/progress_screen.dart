import 'package:flutter/material.dart';
import 'package:widgets_app/presentation/widgets/progress/controlled_progress.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Indicators'),
      ),
      body: const ProgressView(),
    );
  }
}

class ProgressView extends StatelessWidget {
  const ProgressView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return const Center(
      child: Column(children: [
        SizedBox(
          height: 30,
        ),
        Text('Circular progress indicator'),
        SizedBox(
          height: 10,
        ),
        CircularProgressIndicator(
          strokeWidth: 2,
          backgroundColor: Colors.black38,
        ),
        SizedBox(
          height: 20,
        ),
        Text('Circular controlled progress indicator'),
        SizedBox(
          height: 20,
        ),
        ControlledProgress()
      ]),
    );
  }
}
