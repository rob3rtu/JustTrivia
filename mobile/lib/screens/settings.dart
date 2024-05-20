import 'package:flutter/material.dart';
import 'package:mobile/screens/generic/scaffold_purple.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScaffoldPurple(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Settings screen",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
