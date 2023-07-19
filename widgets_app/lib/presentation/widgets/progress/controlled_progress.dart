import 'package:flutter/material.dart';

class ControlledProgress extends StatelessWidget {
  const ControlledProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: Stream.periodic(const Duration(milliseconds: 300), (value) {
          return (value * 2) / 100;
        }).takeWhile((value) => value < 100),
        builder: (context, snapshot) {
          final double progressValue = snapshot.data as double;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  strokeWidth: 2,
                  backgroundColor: Colors.black38,
                  value: progressValue,
                ),
                const SizedBox(width: 20),
                Expanded(
                    child: LinearProgressIndicator(
                  value: progressValue,
                ))
              ],
            ),
          );
        });
  }
}
