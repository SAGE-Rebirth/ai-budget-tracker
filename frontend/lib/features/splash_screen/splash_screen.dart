import 'dart:async';

import 'package:flutter/material.dart';
import 'package:frontend/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      if (!mounted) return;

      // 2. Navigate with a Slide Transition
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const Home(),
          transitionDuration: const Duration(
            milliseconds: 700,
          ), // Slide duration
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // Define slide direction:
            const begin = Offset(1.0, 0.0); // Slides in from the right
            const end = Offset.zero;
            const curve = Curves.linearToEaseOut;

            var tween = Tween(
              begin: begin,
              end: end,
            ).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: Text("Splash Screen")),
        height: double.infinity,
        width: double.infinity,
        color: const Color.fromARGB(145, 248, 248, 248),
      ),
      backgroundColor: Colors.white,
    );
  }
}
