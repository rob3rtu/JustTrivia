import 'package:flutter/material.dart';
import 'package:mobile/navigation/bottom_nav_bar.dart';

class ScaffoldWithNavigation extends StatefulWidget {
  final Widget child;
  const ScaffoldWithNavigation({super.key, required this.child});

  @override
  State<ScaffoldWithNavigation> createState() => _ScaffoldWithNavigationState();
}

class _ScaffoldWithNavigationState extends State<ScaffoldWithNavigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: widget.child, bottomNavigationBar: const CustomBottomNavBar());
  }
}
