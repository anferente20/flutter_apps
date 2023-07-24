import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  const SnackbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y diálogos'),
      ),
      floatingActionButton: FloatingActionButton.extended(
          label: const Text('Mostrar Snackbar'),
          icon: const Icon(Icons.remove_red_eye_outlined),
          onPressed: () => showCustomSnackbar(context)),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          FilledButton.tonal(
              onPressed: () {
                showAboutDialog(context: context, children: [
                  const Text(
                      'Deserunt adipisicing irure ipsum non ullamco exercitation nulla ullamco. In adipisicing in labore cillum irure dolore Lorem nisi minim Lorem elit velit aliquip. Incididunt sint excepteur do deserunt consequat aliquip deserunt ut adipisicing. Voluptate incididunt aute laboris magna cillum. Enim sit labore est reprehenderit officia sit eiusmod cupidatat ea veniam do adipisicing est non. Dolore id ea culpa nisi. Commodo cillum id esse excepteur cillum laboris incididunt ut esse ad consectetur reprehenderit sunt id.')
                ]);
              },
              child: const Text('Licencias usadas')),
          FilledButton.tonal(
              onPressed: () {
                openDialog(context);
              },
              child: const Text('Mostrar diaálogo'))
        ]),
      ),
    );
  }

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Hola Snackbar!'),
      action: SnackBarAction(
        label: '¡Ok!',
        onPressed: () {},
      ),
      duration: const Duration(seconds: 3),
    ));
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('¿Estás seguro?'),
        content: const Text(
            'Voluptate mollit sint do eu voluptate duis velit est ipsum. Aute quis laborum aliqua ad enim dolor. Ullamco minim ex ullamco minim nostrud. Occaecat tempor proident esse incididunt non anim tempor occaecat occaecat ullamco aliquip nulla pariatur quis. Eiusmod consequat sit proident velit ut do excepteur ullamco aliquip. Velit minim ipsum cillum ipsum do mollit. Eiusmod Lorem magna id laboris laboris.'),
        actions: [
          TextButton(
              onPressed: () {
                context.pop();
              },
              child: const Text('Cancelar')),
          FilledButton(
              onPressed: () {
                context.pop();
              },
              child: const Text('Aceptar'))
        ],
      ),
    );
  }
}
