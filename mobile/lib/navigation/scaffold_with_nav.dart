import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/navigation/bottom_nav_bar.dart';

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
        case 2:
          context.goNamed('settings');
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
        body: widget.child, bottomNavigationBar: const CustomBottomNavBar()
        // BottomNavigationBar(
        //   onTap: changeTab,
        //   backgroundColor: Colors.white,
        //   iconSize: 32,
        //   currentIndex: currentIndex,
        //   items: const [
        //     BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        //     BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        //     BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
        //   ],
        // ),
        );
  }
}
