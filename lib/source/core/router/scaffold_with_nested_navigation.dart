// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    if (size.width < 650) {
      return ScaffoldWithNavigationBar(
        body: navigationShell,
        currentIndex: navigationShell.currentIndex,
        onDestinationSelected: _goBranch,
      );
    } else {
      return ScaffoldWithNavigationRail(
        body: navigationShell,
        currentIndex: navigationShell.currentIndex,
        onDestinationSelected: _goBranch,
      );
    }
  }
}

class ScaffoldWithNavigationBar extends StatelessWidget {
  const ScaffoldWithNavigationBar({
    super.key,
    required this.body,
    required this.currentIndex,
    required this.onDestinationSelected,
  });

  final Widget body;
  final int currentIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        destinations: [
          // home
          NavigationDestination(
            icon: const Icon(Icons.home),
            selectedIcon: const Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: const Icon(Icons.view_headline),
            selectedIcon: const Icon(Icons.view_headline),
            label: 'Cadastro',
          ),
          NavigationDestination(
            icon: const Icon(Icons.house_outlined),
            selectedIcon: const Icon(Icons.house_outlined),
            label: 'Abrigos',
          ),
          NavigationDestination(
            icon: const Icon(Icons.map),
            selectedIcon: const Icon(Icons.map_outlined),
            label: 'Localização',
          ),

          NavigationDestination(
            icon: const Icon(Icons.person_4),
            selectedIcon: const Icon(Icons.person_4),
            label: 'Responsáveis',
          ),
        ],
        onDestinationSelected: onDestinationSelected,
      ),
    );
  }
}

class ScaffoldWithNavigationRail extends StatelessWidget {
  const ScaffoldWithNavigationRail({
    super.key,
    required this.body,
    required this.currentIndex,
    required this.onDestinationSelected,
  });

  final Widget body;
  final int currentIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: currentIndex,
            onDestinationSelected: onDestinationSelected,
            labelType: NavigationRailLabelType.all,
            destinations: <NavigationRailDestination>[
              NavigationRailDestination(
                icon: const Icon(Icons.work_outline),
                selectedIcon: const Icon(Icons.work),
                label: Text('Home'),
              ),
              NavigationRailDestination(
                icon: const Icon(Icons.view_headline),
                selectedIcon: const Icon(Icons.view_headline),
                label: Text('Cadastro'),
              ),
              NavigationRailDestination(
                icon: const Icon(Icons.house_outlined),
                selectedIcon: const Icon(Icons.house_outlined),
                label: Text('Abrigos'),
              ),
              NavigationRailDestination(
                icon: const Icon(Icons.map),
                selectedIcon: const Icon(Icons.map_outlined),
                label: Text('Localização'),
              ),
              NavigationRailDestination(
                icon: const Icon(Icons.person_4),
                selectedIcon: const Icon(Icons.person_4),
                label: Text('Responsáveis'),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          // This is the main content.
          Expanded(
            child: body,
          ),
        ],
      ),
    );
  }
}
