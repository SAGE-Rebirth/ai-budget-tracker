import 'package:flutter/material.dart';

class AiCopilot extends StatefulWidget {
  const AiCopilot({super.key});

  @override
  State<AiCopilot> createState() => _AiCopilotState();
}

class _AiCopilotState extends State<AiCopilot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: Text("Ai copilot")),
        height: double.infinity,
        width: double.infinity,
        color: const Color.fromARGB(255, 237, 77, 115),
      ),
      backgroundColor: Colors.white,
    );
  }
}
