import 'package:flutter/material.dart';

class WorkoutsPage extends StatelessWidget {
  const WorkoutsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _WorkoutHint(
      title: 'Séances adaptées',
      points: [
        'Cardio léger avant iftar',
        'Musculation modérée après iftar',
        'Jour de repos planifié',
      ],
    );
  }
}

class _WorkoutHint extends StatelessWidget {
  const _WorkoutHint({required this.title, required this.points});

  final String title;
  final List<String> points;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            for (final point in points)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    const Icon(Icons.check_circle_outline, size: 18),
                    const SizedBox(width: 8),
                    Expanded(child: Text(point)),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
