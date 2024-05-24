import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile/constants/colors.dart';
import 'package:mobile/constants/settings_items.dart';
import 'package:mobile/screens/generic/scaffold_purple.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPurple(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...List.generate(SettingsItems.list.length, (index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    SettingsItems.list[index].category,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                        SettingsItems.list[index].items.length, (index2) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6.0),
                        child: Container(
                          width: double.infinity,
                          decoration: AppColors.transparentWhite,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 12.0),
                            child: Row(
                              children: [
                                Text(
                                  SettingsItems.list[index].items[index2].name,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                Icon(
                                  SettingsItems.list[index].items[index2].icon,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(
                    height: 40,
                  )
                ],
              );
            }),
            SizedBox(
              width: double.infinity,
              child: FloatingActionButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                  backgroundColor: AppColors.lightRed,
                  child: const Text(
                    "Log out",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
