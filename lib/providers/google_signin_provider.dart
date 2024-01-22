import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;
 final _auth = FirebaseAuth.instance;

  Future<void> signIn() async {
    final googleUser = await _googleSignIn.signIn();

    if (googleUser == null) return;
    _user = googleUser;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    await _auth.signInWithCredential(credential);
    // print('SignIn Success ${_user!.email }');
    notifyListeners();
  }

  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
      _user = null;
      notifyListeners();
      // print('Logout Triggered');
    } catch (e) {
      debugPrint('Error during sign-out: $e');
    }
  }
}
