import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const name = 'progress_screen';

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Progress indicators')),
      body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(
            height: 24,
          ),
          Text('Circular progress indicator'),
          SizedBox(
            height: 16,
          ),
          CircularProgressIndicator(
            strokeWidth: 3,
            backgroundColor: Colors.black45,
          ),
          SizedBox(
            height: 24,
          ),
          Text('Circular progress indicator control'),
          SizedBox(
            height: 16,
          ),
          _ControllerProgressIndicator()
        ],
      ),
    );
  }
}

class _ControllerProgressIndicator extends StatelessWidget {
  const _ControllerProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<double>(
        stream: Stream.periodic(const Duration(milliseconds: 300), (value) {
          return (value * 2) / 100;
        }).takeWhile((value) => value < 100),
        builder: (context, snapshot) {
          final progressValue = snapshot.data ?? 0;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  value: progressValue,
                  strokeWidth: 3,
                  backgroundColor: Colors.black26,
                ),
                const SizedBox(width: 16),
                Expanded(
                    child: LinearProgressIndicator(
                  value: progressValue,
                ))
                //LinearProgressIndicator(value: 20, )
              ],
            ),
          );
        });
  }
}
