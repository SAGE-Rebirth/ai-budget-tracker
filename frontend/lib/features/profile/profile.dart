// import 'dart:async';

import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: Text("Profile")),
        height: double.infinity,
        width: double.infinity,
        color: const Color.fromARGB(255, 55, 245, 153),
      ),
      backgroundColor: Colors.white,
    );
  }
}
