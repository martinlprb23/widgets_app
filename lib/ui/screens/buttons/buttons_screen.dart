import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const name = "buttons_screen";

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Buttons Screen")),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pop();
        },
        child: const Icon(Icons.arrow_back_ios),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Wrap(
          spacing: 16,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {}, child: const Text("Elevated button")),
            const ElevatedButton(
                onPressed: null, child: Text("Elevated disable button")),
            ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.alarm),
                label: const Text("Elevated icon button")),
            FilledButton(onPressed: () {}, child: const Text("Filled button")),
            FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.ac_unit),
              label: FilledButton(
                  onPressed: () {}, child: const Text("Filled icon button")),
            ),
            OutlinedButton(
                onPressed: () {}, child: const Text("Outline button")),
            OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.safety_check),
                label: const Text("Outline icon button")),
            TextButton(onPressed: () {}, child: const Text("Text button")),
            TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.today),
                label: const Text("Text icon button")),
            IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
              style: ButtonStyle(
                  iconColor: const MaterialStatePropertyAll(Colors.white),
                  backgroundColor: MaterialStatePropertyAll(colors.primary)),
            ),
            const CustomButton()
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Material(
        color: Colors.deepPurple,
        child: InkWell(
          onTap: () {},
          child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              child: Text(
                "Custom button",
                style: TextStyle(color: Colors.white),
              )),
        ),
      ),
    );
  }
}
