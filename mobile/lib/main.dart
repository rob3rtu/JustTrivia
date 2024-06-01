import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile/models/user_model.dart';
import 'package:mobile/navigation/router.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "lib/.env");

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => UserModel())],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  User? user;

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? userParam) {
      setState(() {
        user = userParam;
      });

      if (userParam != null) {
        Future.microtask(() async {
          QuerySnapshot existingUser = await FirebaseFirestore.instance
              .collection("users")
              .where("email", isEqualTo: userParam.email)
              .get();

          //exisat deja acest user in baza de date
          if (existingUser.docs.isNotEmpty) {
            // ignore: use_build_context_synchronously
            Provider.of<UserModel>(context, listen: false).setUser(
              Userr(
                displayName: existingUser.docs.first['displayName'] ?? '',
                email: existingUser.docs.first['email'] ?? '',
                photoUrl: existingUser.docs.first['photoUrl'] ?? '',
                uid: existingUser.docs.first['uid'],
              ),
            );
          } else {
            //nu exista useru deci il setez intai in baza de date si apoi in provider
            await FirebaseFirestore.instance.collection("users").add({
              "displayName": userParam.email?.split("@")[0],
              "email": userParam.email,
              'photoUrl': userParam.photoURL,
              "uid": userParam.uid
            }).then((value) {
              Provider.of<UserModel>(context, listen: false).setUser(
                Userr(
                  displayName: userParam.email?.split("@")[0] ?? '',
                  email: userParam.email ?? '',
                  photoUrl: userParam.photoURL ?? '',
                  uid: userParam.photoURL ?? '',
                ),
              );
            });
          }
        });
      } else {
        Future.microtask(() {
          Provider.of<UserModel>(context, listen: false).setUser(null);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: goRouter(user),
    );
  }
}
