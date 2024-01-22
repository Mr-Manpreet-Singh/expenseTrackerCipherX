import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker_app/models/user_model.dart';
import 'package:expense_tracker_app/utils/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Signing Up with Email and password
  static Future<bool> signUpUserWithEmailPassword(
    context, {
    required String email,
    required String password,
    required String username,
  }) async {
    bool signUpstatus = true;
    try {
      UserCredential userCred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      UserDetails user = UserDetails(
        email: email,
        password: password,
        name: username,
      );

      // Add user details to Firestore
      await _firestore.collection('users').doc(userCred.user!.uid).set(
            user.toJson(),
          );
    } catch (error) {
      signUpstatus = false;
      customSnackBar(context, error.toString());
    }
    return (signUpstatus);
  }

// loggin user

  static Future<bool> loginUserWithEmailPassword(context,
      {required String email, required String password}) async {
    bool loginStatus = true;
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
      UserCredential userCred =  await _auth.signInWithEmailAndPassword(
            email: email, password: password);

            
      }
    } on Exception catch (e) {
      customSnackBar(context, e.toString());
      loginStatus = false;
    }
    return loginStatus;
  }
}
