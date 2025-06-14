import 'package:flutter/material.dart';
import '../models/workout.dart';
import 'add_workout_page.dart';
import '../widgets/workout_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Workout> workouts = [];

  void addWorkout(Workout workout) {
    setState(() {
      workouts.add(workout);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fitness Tracker"),
        actions: [
          IconButton(
            icon: Icon(Icons.bar_chart),
            onPressed: () {
              Navigator.pushNamed(context, '/summary');
            },
          ),
          IconButton(
            icon: Icon(Icons.monitor_weight),
            onPressed: () {
              Navigator.pushNamed(context, '/bmi');
            },
          ),
        ],
      ),
      body: workouts.isEmpty
          ? Center(child: Text("No workouts logged yet."))
          : ListView.builder(
              itemCount: workouts.length,
              itemBuilder: (context, index) {
                return WorkoutCard(workout: workouts[index]);
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddWorkoutPage(onAdd: addWorkout),
            ),
          );
        },
        child: Icon(Icons.add),
        tooltip: 'Add Workout',
      ),
    );
  }
}