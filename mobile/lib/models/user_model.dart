import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier {
  Userr? _user;

  Userr? get user => _user;

  void setUser(Userr? user) {
    _user = user;
    notifyListeners();
  }

  /// Update specific fields of the user.
  void updateUser({
    String? displayName,
    String? email,
    String? photoUrl,
  }) {
    _user = _user?.copyWith(
      displayName: displayName,
      email: email,
      photoUrl: photoUrl,
    );
    notifyListeners();
  }
}

class Userr {
  final String displayName;
  final String email;
  final String photoUrl;
  final String uid;

  Userr({
    required this.displayName,
    required this.email,
    required this.photoUrl,
    required this.uid,
  });

  Userr copyWith({
    String? displayName,
    String? email,
    String? photoUrl,
    String? uid,
  }) {
    return Userr(
      displayName: displayName ?? this.displayName,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
      uid: uid ?? this.uid,
    );
  }

  @override
  String toString() {
    return 'User(displayName: $displayName, email: $email, photoUrl: $photoUrl, uid: $uid)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Userr &&
        other.displayName == displayName &&
        other.email == email &&
        other.photoUrl == photoUrl &&
        other.uid == uid;
  }

  @override
  int get hashCode {
    return displayName.hashCode ^
        email.hashCode ^
        photoUrl.hashCode ^
        uid.hashCode;
  }
}
