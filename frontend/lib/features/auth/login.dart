import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:frontend/core/constants/app_assets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var logger = Logger();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          title: Text("test"),
          backgroundColor: const Color.fromARGB(255, 238, 70, 70),
        ),
        body: ColoredBox(
          color: const Color.fromARGB(255, 243, 240, 240),
          child: Column(
            children: [
              SizedBox(height: 100),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Username',
                    hintStyle: TextStyle(
                      color: const Color.fromARGB(255, 179, 177, 177),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.symmetric(horizontal: 11),
                  ),
                  style: TextStyle(
                    color: const Color.fromARGB(255, 19, 18, 18),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      color: const Color.fromARGB(255, 179, 177, 177),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.symmetric(horizontal: 11),
                  ),
                  style: TextStyle(
                    color: const Color.fromARGB(255, 19, 18, 18),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  logger.d("clicked");
                },
                child: Text("Forgot Password?"),
              ),
              Center(
                child: SizedBox(
                  height: 45,
                  width: 210,
                  child: ElevatedButton(
                    onPressed: () {
                      logger.d("Login Clicked");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 51, 255, 211),
                      foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("Login")],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 100),
              SizedBox(
                height: 45,
                width: 250,
                child: ElevatedButton(
                  onPressed: () {
                    logger.d("Sign in with Google Clicked");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppAssets.googleIcon, height: 30),
                      Text("Sign in with Google"),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8),
              SizedBox(
                height: 45,
                width: 250,
                child: ElevatedButton(
                  onPressed: () {
                    logger.d("Sign in with Facebook Clicked");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppAssets.facebookIcon, height: 30),
                      Text("Sign in with Facebook"),
                    ],
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [],
              ),
              // Container(
              //   child: Image.asset("assets/images/lion_capital.png"),
              //   padding: EdgeInsets.only(top: 20),
              //   height: 200,
              //   width: 200,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
