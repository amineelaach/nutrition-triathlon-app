import 'package:flutter/material.dart';

import '../hydration/hydration_page.dart';
import '../meal_plan/meal_plan_page.dart';
import '../progress/progress_page.dart';
import '../workouts/workouts_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const _pages = [
    MealPlanPage(),
    HydrationPage(),
    WorkoutsPage(),
    ProgressPage(),
  ];

  static const _titles = [
    'Plan repas',
    'Hydratation',
    'Entraînements',
    'Progression',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_titles[_selectedIndex])),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() => _selectedIndex = index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.restaurant_menu_outlined),
            selectedIcon: Icon(Icons.restaurant_menu),
            label: 'Repas',
          ),
          NavigationDestination(
            icon: Icon(Icons.local_drink_outlined),
            selectedIcon: Icon(Icons.local_drink),
            label: 'Eau',
          ),
          NavigationDestination(
            icon: Icon(Icons.fitness_center_outlined),
            selectedIcon: Icon(Icons.fitness_center),
            label: 'Sport',
          ),
          NavigationDestination(
            icon: Icon(Icons.show_chart_outlined),
            selectedIcon: Icon(Icons.show_chart),
            label: 'Suivi',
          ),
        ],
      ),
    );
  }
}
