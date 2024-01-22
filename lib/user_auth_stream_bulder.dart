import 'package:expense_tracker_app/screens/home_screen/home_screen.dart';
import 'package:expense_tracker_app/screens/sign_in_sign_up_screen/sign_up_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserAuthStreamBuilder extends StatelessWidget {
  const UserAuthStreamBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // print("-----------Executing builder of stream builder");
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          // Authenticated user
          return const HomeScreen();
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error occurred.'));
        } else {
          // Unauthenticated user
          return  SignUpScreen();
        }
      },
    );
  }
}
