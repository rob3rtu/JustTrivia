// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/constants/colors.dart';

import 'package:mobile/models/user_model.dart';
import 'package:mobile/screens/generic/scaffold_purple.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final double profileImageSize = 120;

  final editDisplayName = TextEditingController();

  @override
  void dispose() {
    editDisplayName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userModel = context.watch<UserModel>();

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
                              child: userModel.user?.photoUrl != ''
                                  ? Image.network(
                                      userModel.user?.photoUrl ?? '',
                                      height: profileImageSize,
                                      width: profileImageSize,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.asset(
                                      "lib/assets/golden.png",
                                      height: profileImageSize,
                                      width: profileImageSize,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              userModel.user?.displayName ?? '',
                              style: const TextStyle(
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
                                onPressed: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return SizedBox.expand(
                                          child: ScaffoldPurple(
                                            body: Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      _pickImageFromGallery(
                                                          context);
                                                    },
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          width:
                                                              profileImageSize,
                                                          height:
                                                              profileImageSize,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              const BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle),
                                                          child: userModel.user
                                                                      ?.photoUrl !=
                                                                  ''
                                                              ? Image.network(
                                                                  userModel.user
                                                                          ?.photoUrl ??
                                                                      '',
                                                                  height:
                                                                      profileImageSize,
                                                                  width:
                                                                      profileImageSize,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                )
                                                              : Image.asset(
                                                                  "lib/assets/golden.png",
                                                                  height:
                                                                      profileImageSize,
                                                                  width:
                                                                      profileImageSize,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        const Text(
                                                          "Schimba imaginea",
                                                          style: TextStyle(
                                                              color: Color
                                                                  .fromARGB(
                                                                      149,
                                                                      255,
                                                                      255,
                                                                      255),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 12),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 32.0,
                                                        vertical: 8.0),
                                                    child: TextField(
                                                      controller:
                                                          editDisplayName,
                                                      style: const TextStyle(
                                                          color: Colors.white),
                                                      decoration:
                                                          const InputDecoration(
                                                        border: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10))),
                                                        labelText:
                                                            "Nume de utilizator nou",
                                                      ),
                                                    ),
                                                  ),
                                                  ElevatedButton(
                                                      child: const Text(
                                                          'Salveaza numele'),
                                                      onPressed: () async {
                                                        QuerySnapshot
                                                            existingUser =
                                                            await FirebaseFirestore
                                                                .instance
                                                                .collection(
                                                                    "users")
                                                                .where("email",
                                                                    isEqualTo: userModel
                                                                            .user
                                                                            ?.email ??
                                                                        '')
                                                                .get();

                                                        if (existingUser.docs
                                                                .isNotEmpty &&
                                                            editDisplayName.text
                                                                .isNotEmpty) {
                                                          final myUserDoc =
                                                              existingUser
                                                                  .docs.first;

                                                          await myUserDoc
                                                              .reference
                                                              .update({
                                                            "displayName":
                                                                editDisplayName
                                                                    .text
                                                          }).then((value) {
                                                            userModel.updateUser(
                                                                displayName:
                                                                    editDisplayName
                                                                        .text);
                                                          });
                                                          editDisplayName.text =
                                                              '';

                                                          Navigator.pop(
                                                              context);
                                                        }
                                                      }),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      });
                                },
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

  Future _pickImageFromGallery(BuildContext context) async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) return;

    File imageFile = File(returnedImage.path);

    String? userEmail = context.read<UserModel>().user?.email;
    final userModel = context.read<UserModel>();

    final usersProfileImageRef =
        FirebaseStorage.instance.ref().child("$userEmail/profile-image.jpg");

    try {
      await usersProfileImageRef.putFile(imageFile);
      String imageLink = await usersProfileImageRef.getDownloadURL();

      QuerySnapshot existingUser = await FirebaseFirestore.instance
          .collection("users")
          .where("email", isEqualTo: userModel.user?.email ?? '')
          .get();

      if (existingUser.docs.isNotEmpty) {
        final myUserDoc = existingUser.docs.first;

        await myUserDoc.reference.update({"photoUrl": imageLink}).then((value) {
          userModel.updateUser(photoUrl: imageLink);
        });

        Navigator.pop(context);
      }
    } catch (e) {
      print(e);
    }
  }
}
