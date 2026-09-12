import 'package:flutter/material.dart';

class Analytics extends StatefulWidget {
  const Analytics({super.key});

  @override
  State<Analytics> createState() => _AnalyticsState();
}

class _AnalyticsState extends State<Analytics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: Text("Analytics")),
        height: double.infinity,
        width: double.infinity,
        color: const Color.fromARGB(255, 171, 215, 251),
      ),
      backgroundColor: Colors.white,
    );
  }
}
