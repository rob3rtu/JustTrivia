import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/constants/colors.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int currentIndex = 0;

  List<Widget> icons = [
    const Icon(
      Icons.home_outlined,
      size: 42,
    ),
    const Icon(
      Icons.person_outline,
      size: 42,
    ),
    const Icon(
      Icons.settings_outlined,
      size: 42,
    )
  ];

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

    return Container(
      width: double.infinity,
      color: AppColors.darkPurple,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.red,
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Row(
                children: List.generate(icons.length, (index) {
                  return Expanded(
                    child: GestureDetector(
                      child: icons[index],
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
