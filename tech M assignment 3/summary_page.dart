import 'package:flutter/material.dart';

class SummaryPage extends StatelessWidget {
  const SummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Workout Summary")),
      body: Center(
        child: Text("Summary feature is optional. Add analytics here."),
      ),
    );
  }
}