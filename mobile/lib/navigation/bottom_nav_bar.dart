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

  List<IconData> icons = [
    Icons.home,
    Icons.person_outline,
    Icons.settings_outlined,
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
              color: const Color.fromRGBO(255, 255, 255, 0.2),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
                children: List.generate(icons.length, (index) {
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        changeTab(index);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            icons[index],
                            size: 42,
                            color: index == currentIndex
                                ? Colors.white
                                : const Color.fromRGBO(232, 234, 237, 0.5),
                            shadows: index == currentIndex
                                ? [
                                    const Shadow(
                                        color: Colors.white,
                                        blurRadius: 8.8,
                                        offset: Offset(0, 0))
                                  ]
                                : [],
                          ),
                          if (index == currentIndex)
                            const Icon(
                              Icons.circle,
                              size: 6,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                    color: Colors.white,
                                    blurRadius: 8.8,
                                    offset: Offset(0, 0))
                              ],
                            )
                        ],
                      ),
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
