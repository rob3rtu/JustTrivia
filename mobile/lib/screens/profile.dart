import 'package:flutter/material.dart';
import 'package:mobile/screens/generic/scaffold_purple.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScaffoldPurple(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Profile screen",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
