import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'screens/add_workout_page.dart';
import 'screens/bmi_calculator_page.dart';
import 'screens/summary_page.dart';

void main() {
  runApp(FitnessTrackerApp());
}

class FitnessTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: HomePage(),
      routes: {
        '/add': (context) => AddWorkoutPage(onAdd: (w) {}),
        '/bmi': (context) => BMICalculatorPage(),
        '/summary': (context) => SummaryPage(),
      },
    );
  }
}