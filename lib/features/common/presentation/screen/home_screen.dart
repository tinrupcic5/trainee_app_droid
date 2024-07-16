import 'package:flutter/material.dart';
import 'package:trainee_app/core/localization_extension.dart';
import 'package:trainee_app/core/style/style_extensions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedScreenIndex = 0;

  final _screens = const [
    // SightsScreen(),
    // FavoritesScreen(),
    // SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _screens[_selectedScreenIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedScreenIndex,
        selectedItemColor: context.colorSecondary,
        onTap: (index) => setState(() => _selectedScreenIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.explore_outlined),
            activeIcon: const Icon(Icons.explore_rounded),
            label: context.summaryPage,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.favorite_outline_rounded),
            activeIcon: const Icon(Icons.favorite_rounded),
            label: context.calendarPage,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_outline_rounded),
            activeIcon: const Icon(Icons.person_rounded),
            label: context.myProfilePage,
          ),
        ],
      ),
    );
  }
}
