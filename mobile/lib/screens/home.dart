import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Home screen"),
        FloatingActionButton(
          onPressed: () {
            context.goNamed('profile');
          },
          child: const Text("Go to Profile"),
        )
      ],
    );
  }
}
