
import 'package:expense_tracker_app/user_auth_stream_bulder.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Simulate a time-consuming operation (e.g., fetching data, initialization)
  Future<void> _mockInitialization() async {
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _mockInitialization(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.active:
            case ConnectionState.waiting:
              // While waiting for the initialization to complete, show a loading indicator
              return const Center(child: Splash());
            case ConnectionState.done:
              // Once the initialization is done, navigate to the main screen or any other screen
              return const UserAuthStreamBuilder(); // Replace with your main screen widget
          }
        },
      ),
    );
  }
}

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 123, 97, 255),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Transform.rotate(
              alignment: Alignment.center,
              angle: 3.15,
              child: Image.asset(
                "assets/images/circular_design.png",
                width: 200,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              "assets/images/circular_design.png",
              width: 200,
            ),
          ),
          Center(
            child: Column(
              children:[ 
                Image.asset("assets/images/logo.png"),
                Text(
                "CipherX.",
                style: GoogleFonts.brunoAceSc(
                  fontSize: 36,
                  color: Colors.white,
                ),
              ),]
            ),
          )
        ],
      ),
    );
  }
}
