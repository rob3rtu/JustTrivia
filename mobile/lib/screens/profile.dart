import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Profile screen"),
            FloatingActionButton(
              heroTag: "profileButton",
              onPressed: () {
                context.goNamed('home');
              },
              child: const Text("Go to Home"),
            )
          ],
        ),
      ),
    );
  }
}
