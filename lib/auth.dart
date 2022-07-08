import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

late User user1;

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  Future<bool> signIn({required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      user1 = _firebaseAuth.currentUser!;
      user1.updateDisplayName("AUFA RIZKY");
      return true;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message ?? "Unknow Error");
      return false;
    }

  }

  Future<bool> signUp({required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message ?? "Unknow Error");
      return false;
    }
  }
}