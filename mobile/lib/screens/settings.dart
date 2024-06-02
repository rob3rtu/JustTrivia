import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile/constants/colors.dart';
import 'package:mobile/constants/settings_items.dart';
import 'package:mobile/models/user_model.dart';
import 'package:mobile/screens/generic/scaffold_purple.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final responseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    UserModel userModel = context.watch<UserModel>();

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
                        child: GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  final category = SettingsItems
                                          .list[index].items[index2].name
                                          .contains("problema")
                                      ? "bugs"
                                      : SettingsItems
                                              .list[index].items[index2].name
                                              .contains("intrebare")
                                          ? "questions"
                                          : "delete";

                                  return ScaffoldPurple(
                                      body: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16, horizontal: 16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          SettingsItems
                                              .list[index].items[index2].name,
                                          style: const TextStyle(
                                              fontSize: 24,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        if (category != 'delete')
                                          TextFormField(
                                            controller: responseController,
                                            minLines: 6,
                                            maxLines: 6,
                                            maxLength: 100,
                                            keyboardType:
                                                TextInputType.multiline,
                                            style: const TextStyle(
                                                color: Colors.white),
                                            decoration: const InputDecoration(
                                              alignLabelWithHint: true,
                                              border: OutlineInputBorder(),
                                              labelText:
                                                  'Poti scrie aici ce ai de zis',
                                            ),
                                          )
                                        else
                                          const Text(
                                            "Esti sigur???",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        if (category != 'delete')
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: ElevatedButton(
                                                child: const Text('Trimite'),
                                                onPressed: () async {
                                                  if (responseController
                                                      .text.isNotEmpty) {
                                                    try {
                                                      await FirebaseFirestore
                                                          .instance
                                                          .collection(category)
                                                          .add({
                                                        "user": userModel
                                                                .user?.email ??
                                                            '',
                                                        "description":
                                                            responseController
                                                                .text
                                                      });

                                                      ScaffoldMessenger.of(
                                                          // ignore: use_build_context_synchronously
                                                          context).showSnackBar(
                                                        const SnackBar(
                                                            content: Text(
                                                                'Raspuns trimis cu succes!')),
                                                      );

                                                      // ignore: use_build_context_synchronously
                                                      Navigator.pop(context);
                                                    } catch (e) {
                                                      ScaffoldMessenger.of(
                                                          // ignore: use_build_context_synchronously
                                                          context).showSnackBar(
                                                        const SnackBar(
                                                            content: Text(
                                                                'Nu s-a putut trimite raspunsul')),
                                                      );
                                                      print(e);
                                                    }
                                                  }
                                                }),
                                          )
                                        else
                                          Center(
                                            child: ElevatedButton(
                                              child:
                                                  const Text('Da, sterge-l!'),
                                              onPressed: () async {
                                                try {
                                                  QuerySnapshot existignUser =
                                                      await FirebaseFirestore
                                                          .instance
                                                          .collection('users')
                                                          .where('email',
                                                              isEqualTo:
                                                                  userModel.user
                                                                      ?.email)
                                                          .get();

                                                  if (existignUser
                                                      .docs.isNotEmpty) {
                                                    DocumentReference
                                                        firestoreRef =
                                                        existignUser.docs.first
                                                            .reference;

                                                    await firestoreRef.delete();

                                                    // dont work now, but it would be overwrited if the user
                                                    //creates a new account with this mail

                                                    // String usersEmail =
                                                    //     userModel.user?.email ??
                                                    //         '';

                                                    // final storageRef =
                                                    //     FirebaseStorage.instance
                                                    //         .ref()
                                                    //         .child(usersEmail);

                                                    // await storageRef.delete();

// Delete the user from Firebase Authentication
                                                    final user = FirebaseAuth
                                                        .instance.currentUser;
                                                    await user?.delete();
                                                    print("STERS");
                                                  }
                                                } catch (e) {
                                                  print(e);
                                                  ScaffoldMessenger.of(
                                                      // ignore: use_build_context_synchronously
                                                      context).showSnackBar(
                                                    const SnackBar(
                                                        content: Text(
                                                            'Nu s-a putut sterge contul')),
                                                  );
                                                }
                                              },
                                            ),
                                          ),
                                      ],
                                    ),
                                  ));
                                });
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: AppColors.transparentWhite,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 12.0),
                              child: Row(
                                children: [
                                  Icon(
                                    SettingsItems
                                        .list[index].items[index2].icon,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    SettingsItems
                                        .list[index].items[index2].name,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
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
