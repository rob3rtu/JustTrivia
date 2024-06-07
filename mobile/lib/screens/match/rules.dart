import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/constants/colors.dart';
import 'package:mobile/screens/generic/scaffold_purple.dart';

class RulesScreen extends StatelessWidget {
  RulesScreen({super.key});

  final List<String> rules = [
    "\u2022 Un meci are 7 intrebari.",
    "\u2022 O intrebare are 10 secunde de raspuns.",
    "\u2022 Daca ambii jucatori dau raspunsul corect castiga punctul cel care a raspuns mai repede.",
  ];

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
          const Text(
            "Rules",
            style: TextStyle(
                color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 40,
          ),
          ...List.generate(
              rules.length,
              (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      rules[index],
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  )),
          Expanded(
              child: Column(
            children: [
              const Spacer(),
              SizedBox(
                  width: double.infinity,
                  child: FloatingActionButton(
                      onPressed: () {
                        context.pushNamed("createOrJoin");
                      },
                      backgroundColor: AppColors.green,
                      child: const Text(
                        "Joaca",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ))),
            ],
          ))
        ],
      ),
    ));
  }
}
