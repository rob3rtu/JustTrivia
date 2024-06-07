import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/screens/generic/scaffold_purple.dart';

class CreateOrJoinScreen extends StatelessWidget {
  const CreateOrJoinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPurple(
        body: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(
                Icons.chevron_left,
                color: Colors.white,
                size: 42,
              )),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            child: FloatingActionButton(
                onPressed: () {},
                backgroundColor: const Color.fromRGBO(255, 255, 255, 0.2),
                child: const Text(
                  "Creeaza meci",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                )),
          )
        ],
      ),
    ));
  }
}
