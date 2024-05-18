import 'package:firebase_auth/firebase_auth.dart';
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
        ),
        FloatingActionButton(
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
          },
          child: const Text("Log out"),
        )
      ],
    );
  }
}
