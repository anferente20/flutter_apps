import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: const Text('Cubits'),
            subtitle: const Text('Gestor de estado simple'),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
            onTap: () => context.push('/cubits'),
          ),
          ListTile(
            title: const Text('Bloc'),
            subtitle: const Text('Gestor de estado complejo'),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
            onTap: () => context.push('/bloc'),
          ),
          ListTile(
            title: const Text('New user form'),
            subtitle: const Text('Formulario para nuevos usuarios'),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
            onTap: () => context.push('/new-user-form'),
          )
        ],
      ),
    );
  }
}
