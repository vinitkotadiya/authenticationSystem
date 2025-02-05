import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pocketplans/Repository/user_repository.dart';
import 'package:pocketplans/models/user_model.dart';
import 'package:pocketplans/utils/utils.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  UserRepository userRepository = UserRepository();
  Stream<User?> get authChanges => _auth.authStateChanges();
  Future<bool> signInGoogle(BuildContext context) async {
    bool res = false;
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      User? user = userCredential.user;
      if (user != null) {
        if (userCredential.additionalUserInfo!.isNewUser) {
          UserModel userModel = new UserModel(
              userId: user.uid,
              userName: user.displayName,
              userImage: user.photoURL,
              userEmail: user.email);
          userRepository.addData('users', userModel.toJson(), user.uid);
        }
        res = true;
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
      res = false;
    }
    return res;
  }
}
