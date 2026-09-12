import 'package:flutter/material.dart';
import 'package:frontend/custom_icons.dart';
import 'package:logger/logger.dart';
import 'package:frontend/features/dashboard/dashboard.dart';
import 'package:frontend/features/profile/profile.dart';
import 'package:frontend/features/aiAdvisor/ai_copilot.dart';
import 'package:frontend/features/analytics/analytics.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

final logger = Logger();
List colors = [Colors.greenAccent, Colors.white, Colors.grey, Colors.black];

class _HomeState extends State<Home> {
  void printSmtg() {}
  int selectedIndex = 0;
  void onItemTapped(int index) {
    setState(() {
      logger.d("pressed $index");
      selectedIndex = index;
    });
  }

  final List _pages = [Dashboard(), Analytics(), AiCopilot(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors[1],
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Budget Tracker",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Rubik",
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        titleTextStyle: TextStyle(
          fontSize: 15,
          color: const Color.fromARGB(255, 93, 81, 81),
        ),
        elevation: 0,
        // leading: Icon(Icons.menu_book),
        // actions: [
        //   Icon(Icons.bookmark),
        //   Padding(padding: EdgeInsetsGeometry.only(right: 5)),
        // ],
      ),
      // drawer: Drawer(
      //   child: ListView(
      //     children: [
      //       DrawerHeader(
      //         decoration: BoxDecoration(color: Colors.white),
      //         child: Icon(Icons.menu_book, color: Colors.black, size: 50),
      //       ),
      //       ListTile(
      //         title: Text(
      //           "Home",
      //           textAlign: TextAlign.center,
      //           style: TextStyle(
      //             fontFamily: "Rubik",
      //             fontWeight: FontWeight.w500,
      //             fontSize: 16,
      //           ),
      //         ),
      //         onTap: () => logger.d("pressed dashboard"),
      //       ),
      //       ListTile(
      //         title: Text(
      //           "Analytics",
      //           textAlign: TextAlign.center,
      //           style: TextStyle(
      //             fontFamily: "Rubik",
      //             fontWeight: FontWeight.w600,
      //             fontSize: 16,
      //           ),
      //         ),
      //         onTap: () => logger.d("pressed analytics"),
      //       ),
      //       ListTile(
      //         title: Text(
      //           "Ai Copilot",
      //           textAlign: TextAlign.center,
      //           style: TextStyle(
      //             fontFamily: "Rubik",
      //             fontWeight: FontWeight.w600,
      //             fontSize: 16,
      //           ),
      //         ),
      //         onTap: () => logger.d("pressed ai copilot"),
      //       ),
      //       ListTile(
      //         title: Text(
      //           "Profile",
      //           textAlign: TextAlign.center,
      //           style: TextStyle(
      //             fontFamily: "Rubik",
      //             fontWeight: FontWeight.w600,
      //             fontSize: 16,
      //           ),
      //         ),
      //         onTap: () => logger.d("pressed profile"),
      //       ),
      //     ],
      //   ),
      // ),
      body: Center(child: _pages[selectedIndex]),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent, // Removes ripple effect on tap
          highlightColor: Colors.transparent, // Removes highlight state
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          elevation: 0,
          onTap: (value) => onItemTapped(value),
          backgroundColor: Colors.transparent,
          // selectedIconTheme: IconThemeData(color: Colors.red, size: 30),
          selectedItemColor: Colors.greenAccent,
          unselectedItemColor: const Color.fromARGB(255, 72, 72, 72),
          selectedLabelStyle: TextStyle(
            fontSize: 15,
            color: Colors.red,
            fontFamily: "Rubik",
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontFamily: "Rubik",
            fontWeight: FontWeight.w400,
          ),
          items: [
            BottomNavigationBarItem(
              icon: Icon(MyCustomIcons.gemini_svg),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.analytics_outlined),
              label: "Analytics",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.smart_toy),
              label: "Ai Copilot",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
    );
  }
}
