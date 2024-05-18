import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Profile screen"),
        FloatingActionButton(
          onPressed: () {
            context.goNamed('home');
          },
          child: const Text("Go to Home"),
        )
      ],
    );
  }
}
