import 'package:flutter/material.dart';

class HydrationPage extends StatelessWidget {
  const HydrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _CardSection(
      icon: Icons.water_drop,
      title: 'Objectif hydratation',
      subtitle: 'Prépare un plan d\'eau entre iftar et suhoor.',
    );
  }
}

class _CardSection extends StatelessWidget {
  const _CardSection({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: ListTile(
        leading: Icon(icon, color: theme.colorScheme.primary),
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}
