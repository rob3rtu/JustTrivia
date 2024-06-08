import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobile/models/user_model.dart';

class MatchModel extends ChangeNotifier {
  String _roomId = '';
  String get roomId => _roomId;

  Future<void> createNewRoom(Userr? user) async {
    Random random = Random();
    int randomNumber =
        random.nextInt(10000); // Generates a number from 0 to 9999
    setRoomId(randomNumber.toString().padLeft(4, '0'));

    //create room on Firestore
    try {
      await FirebaseFirestore.instance.collection('rooms').doc(_roomId).set({
        "currentQuestion": 0,
        "showAfterQuestion": false,
        "showCorrect": false,
        "timeLeft": 10,
        "user1": {
          "score": 0,
          "photoUrl": user?.photoUrl ?? '',
          "displayName": user?.displayName ?? ''
        },
        "user2": {"score": 0, "photoUrl": '', "displayName": ''},
        "user1Answ": '',
        "user2Answ": '',
      });
    } catch (e) {
      print("Nu s a generat match room");
      print(e);
      setRoomId('');
    }
  }

  Future<void> deleteRoom() async {
    try {
      await FirebaseFirestore.instance
          .collection('rooms')
          .doc(_roomId)
          .delete();
      setRoomId('');
    } catch (e) {
      print("Nu s a putut sterge match room");
      print(e);
    }
  }

  void setRoomId(String id) {
    _roomId = id;
    notifyListeners();
  }
}
