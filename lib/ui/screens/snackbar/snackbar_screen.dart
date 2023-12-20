import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final snackbar = SnackBar(
      content: const Text('Hello world'),
      duration: const Duration(seconds: 2),
      action: SnackBarAction(
        label: 'OK',
        onPressed: () {},
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Are you sure?'),
        actions: [
          TextButton(
              onPressed: () => context.pop(), child: const Text('Cancel')),
          FilledButton(onPressed: () {}, child: const Text('Accept'))
        ],
        content: const Text(
            'Lorem ipsum es el texto que se usa habitualmente en diseño gráfico en demostraciones de tipografías'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars and dialogs'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
                onPressed: () {
                  showAboutDialog(context: context, children: [
                    const Text(
                        "Lorem ipsum es el texto que se usa habitualmente en diseño gráfico en demostraciones de tipografías")
                  ]);
                },
                child: const Text('Licences')),
            FilledButton(
                onPressed: () => openDialog(context),
                child: const Text('Show dialog'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackbar(context),
        icon: const Icon(Icons.remove_red_eye_outlined),
        label: const Text('Show snackbar'),
      ),
    );
  }
}
