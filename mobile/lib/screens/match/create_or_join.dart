import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/models/match_model.dart';
import 'package:mobile/models/user_model.dart';
import 'package:mobile/screens/generic/scaffold_purple.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class CreateOrJoinScreen extends StatefulWidget {
  const CreateOrJoinScreen({super.key});

  @override
  State<CreateOrJoinScreen> createState() => _CreateOrJoinScreenState();
}

class _CreateOrJoinScreenState extends State<CreateOrJoinScreen> {
  String roomId = '';

  @override
  Widget build(BuildContext context) {
    MatchModel matchModel = context.read<MatchModel>();
    UserModel userModel = context.watch<UserModel>();

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
                heroTag: "creeaza meci",
                onPressed: () async {
                  await matchModel.createNewRoom(userModel.user);
                  // ignore: use_build_context_synchronously
                  context.pushNamed('createdRoom');
                },
                backgroundColor: const Color.fromRGBO(255, 255, 255, 0.2),
                child: const Text(
                  "Creeaza meci",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                )),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(children: <Widget>[
              Expanded(child: Divider()),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
                child: Text(
                  "OR",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Expanded(child: Divider()),
            ]),
          ),
          Center(
            child: Pinput(
              defaultPinTheme: PinTheme(
                  width: 56,
                  height: 56,
                  textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromRGBO(255, 255, 255, 0.2)),
                    borderRadius: BorderRadius.circular(5),
                  )),
              onCompleted: (pin) {
                print(pin);
                setState(() {
                  roomId = pin;
                });
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            child: FloatingActionButton(
                heroTag: "intra in meci",
                onPressed: () {},
                backgroundColor: const Color.fromRGBO(255, 255, 255, 0.2),
                child: const Text(
                  "Intra in meci",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                )),
          ),
        ],
      ),
    ));
  }
}
