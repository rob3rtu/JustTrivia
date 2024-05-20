import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkPurple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Home screen",
              style: TextStyle(color: Colors.white),
            ),
            FloatingActionButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
              },
              child: const Text("Log out"),
            )
          ],
        ),
      ),
    );
  }
}
