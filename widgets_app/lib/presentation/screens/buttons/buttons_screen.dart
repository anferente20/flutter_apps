import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/widgets/buttons/custom_button.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons'),
      ),
      body: const ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () {
          context.pop();
        },
      ),
    );
  }
}

class ButtonsView extends StatelessWidget {
  const ButtonsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('Elevated Button'),
            ),
            const ElevatedButton(
              onPressed: null,
              child: Text('Elevated Button Disabled'),
            ),
            ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.access_alarm_rounded),
                label: const Text('Elevated Icon Button')),
            FilledButton(onPressed: () {}, child: const Text('Filled Button')),
            FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.account_balance_wallet_rounded),
                label: const Text('Filled Icon Button')),
            OutlinedButton(onPressed: () {}, child: const Text('Outline Button')),
            OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add_rounded),
                label: const Text('Outline Icon Button')),
            TextButton(onPressed: () {}, child: const Text('Text Button')),
            TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.wine_bar),
                label: const Text('Text Icon Button')),
            IconButton(onPressed: () {}, icon: const Icon(Icons.wifi_channel_rounded)),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.wifi_rounded,
                color: Colors.white,
              ),
              style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(colors.primary)),
            ),
            const CustomButton()
          ],
        ));
  }
}
