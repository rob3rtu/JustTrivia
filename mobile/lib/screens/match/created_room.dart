import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/models/match_model.dart';
import 'package:mobile/screens/generic/scaffold_purple.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class CreatedRoom extends StatelessWidget {
  const CreatedRoom({super.key});

  final double iconsImageSize = 300;

  @override
  Widget build(BuildContext context) {
    MatchModel matchModel = context.watch<MatchModel>();

    return ScaffoldPurple(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Image.asset(
                    "lib/assets/icons_top.png",
                    height: iconsImageSize,
                    // width: iconsImageSize,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Pinput(
                  defaultPinTheme: PinTheme(
                      width: 60,
                      height: 60,
                      textStyle: const TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromRGBO(255, 255, 255, 0.2)),
                        borderRadius: BorderRadius.circular(5),
                      )),
                  readOnly: true,
                  controller: TextEditingController(text: matchModel.roomId),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: SizedBox(
                    width: 100,
                    child: FloatingActionButton(
                        heroTag: "close room",
                        onPressed: () async {
                          await matchModel.deleteRoom();
                          // ignore: use_build_context_synchronously
                          context.pop();
                        },
                        backgroundColor:
                            const Color.fromRGBO(255, 255, 255, 0.2),
                        child: const Text(
                          "Inapoi",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Image.asset(
                    "lib/assets/icons_bottom.png",
                    height: iconsImageSize,
                    // width: iconsImageSize,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
