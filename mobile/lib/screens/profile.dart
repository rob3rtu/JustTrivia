import 'package:flutter/material.dart';
import 'package:mobile/constants/colors.dart';
import 'package:mobile/screens/generic/scaffold_purple.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  final double profileImageSize = 120;

  @override
  Widget build(BuildContext context) {
    return ScaffoldPurple(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Center(
                        child: Column(
                          children: [
                            Container(
                              width: profileImageSize,
                              height: profileImageSize,
                              clipBehavior: Clip.antiAlias,
                              decoration:
                                  const BoxDecoration(shape: BoxShape.circle),
                              child: Image.asset(
                                "lib/assets/golden.png",
                                height: profileImageSize,
                                width: profileImageSize,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "Robert",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromRGBO(255, 255, 255, 0.2)),
                          child: Center(
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: AppColors.transparentWhite,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "70%",
                                style: TextStyle(
                                    color: AppColors.green,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "143",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24),
                                  ),
                                  Text(
                                    "meciuri",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                              Text(
                                "30%",
                                style: TextStyle(
                                    color: AppColors.darkRed,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("100 victorii",
                                      style: TextStyle(
                                          color: AppColors.green,
                                          fontWeight: FontWeight.w600)),
                                  Text(
                                    "30 infrangeri",
                                    style: TextStyle(
                                        color: AppColors.darkRed,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                              LinearProgressIndicator(
                                color: AppColors.green,
                                backgroundColor: AppColors.darkRed,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                minHeight: 10,
                                value: 0.7,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
