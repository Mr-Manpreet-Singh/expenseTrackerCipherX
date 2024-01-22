import 'package:expense_tracker_app/firebase_options.dart';
import 'package:expense_tracker_app/user_auth_stream_bulder.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:expense_tracker_app/providers/transaction_provider.dart';
import 'package:expense_tracker_app/providers/google_signin_provider.dart';
import 'package:expense_tracker_app/providers/account_details_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GoogleSignInProvider()),
        ChangeNotifierProvider(create: (context) => TransactionProvider()),
        ChangeNotifierProvider(create: (context) => AccountDetailsProvider()),
      ],
      //
      child:
          // return
          MaterialApp(
        theme: ThemeData(
          fontFamily: 'inter',
          primaryColor: const Color(0xFF7E3DFF),
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF7E3DFF)),
          useMaterial3: true,
        ),
        home: const UserAuthStreamBuilder(),
      ),
    );
  }
}
