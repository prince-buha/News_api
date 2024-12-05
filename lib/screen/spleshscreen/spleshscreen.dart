import 'dart:async';

import 'package:flutter/material.dart';

import '../../Routes/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 10), () {
      Navigator.pushReplacementNamed(context, Routes.homescreen);
    });
    return Scaffold(
      backgroundColor: const Color(0xffBFC7C0),
      body: Column(
        children: [
          const SizedBox(height: 200),
          Center(
              child: Image.network(
                  "https://i.pinimg.com/originals/af/fc/e4/affce475466fa937e7592a65f59e0360.gif")),
          const SizedBox(height: 50),
          const Text(
            " News_App ",
            style: TextStyle(
              fontSize: 25,
              letterSpacing: 3,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            " Welcome ",
            style: TextStyle(
              fontSize: 20,
              letterSpacing: 5,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
