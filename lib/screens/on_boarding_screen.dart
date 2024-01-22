import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:expense_tracker_app/screens/sign_in_sign_up_screen/sign_up_screen.dart';

class GettingStarted extends StatelessWidget {
  const GettingStarted({super.key});

  @override
  Widget build(BuildContext context) {
    // print("Rebuilding GettingSTARTED.....");
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 123, 97, 255),
      body: Stack(alignment: Alignment.center, children: [
        Positioned(
            top: 60,
            left: 40,
            child: Image.asset(
              'assets/images/logo.png',
              width: 80,
            )),
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
        Positioned(
          bottom: 50,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textBox(),
                    const SizedBox(width: 20),
                    circularButton(context)
                  ],
                ),
                Text(
                  "The best way to track your expenses.",
                  style: GoogleFonts.aBeeZee(fontSize: 20, color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }

// Text -> welcome to CipherX

  Column textBox() {
    return Column(
      children: [
        Text(
          "Welcome to",
          style: GoogleFonts.aBeeZee(
            fontSize: 40,
            color: Colors.white,
          ),
        ),
        Text(
          "CipherX.",
          style: GoogleFonts.brunoAceSc(
            fontSize: 36,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  // getting Started Button

  InkWell circularButton(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => SignUpScreen(),
          ),
        );
      },
      child: Container(
        width: 90,
        height: 90,
        decoration: const BoxDecoration(
            color: Color(0xEDE1E1BF), shape: BoxShape.circle),
        child: const Icon(Icons.keyboard_arrow_right_rounded,
            size: 90, color: Colors.black87),
      ),
    );
  }
}
