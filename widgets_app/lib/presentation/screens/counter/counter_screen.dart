import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter/counter_provider.dart';

class CounterScreeen extends ConsumerWidget {
  const CounterScreeen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod Counter'),
      ),
      body: const _CounterView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          ref.read(counterProvider.notifier).state++;
        },
      ),
    );
  }
}

class _CounterView extends ConsumerWidget {
  const _CounterView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clickCounter = ref.watch(counterProvider);
    return Center(
      child: Text(
        'Valor $clickCounter',
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
