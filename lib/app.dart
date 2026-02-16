import 'package:flutter/material.dart';

import 'core/app_theme.dart';
import 'features/home/home_page.dart';

class RamadanFitApp extends StatelessWidget {
  const RamadanFitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RamadanFit',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      home: const HomePage(),
    );
  }
}
