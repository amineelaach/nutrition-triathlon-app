import 'package:flutter/material.dart';

class ProgressPage extends StatelessWidget {
  const ProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Suivi hebdomadaire'),
            SizedBox(height: 12),
            LinearProgressIndicator(value: 0.65),
            SizedBox(height: 8),
            Text('Objectifs atteints: 65 %'),
          ],
        ),
      ),
    );
  }
}
