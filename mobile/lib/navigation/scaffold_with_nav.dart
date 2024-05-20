import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/constants/colors.dart';

class ScaffoldWithNavigation extends StatefulWidget {
  final Widget child;
  const ScaffoldWithNavigation({super.key, required this.child});

  @override
  State<ScaffoldWithNavigation> createState() => _ScaffoldWithNavigationState();
}

class _ScaffoldWithNavigationState extends State<ScaffoldWithNavigation> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    void changeTab(int index) {
      switch (index) {
        case 0:
          context.goNamed('home');
          break;
        case 1:
          context.goNamed('profile');
          break;
        default:
          context.goNamed('home');
          break;
      }
      setState(() {
        currentIndex = index;
      });
    }

    return Scaffold(
      backgroundColor: AppColors.darkPurple,
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        onTap: changeTab,
        backgroundColor: const Color(0xffe0b9f6),
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
