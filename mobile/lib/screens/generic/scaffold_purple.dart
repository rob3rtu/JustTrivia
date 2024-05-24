import 'package:flutter/material.dart';
import 'package:mobile/constants/colors.dart';

class ScaffoldPurple extends StatelessWidget {
  final Widget body;
  const ScaffoldPurple({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: body),
      backgroundColor: AppColors.darkPurple,
    );
  }
}
