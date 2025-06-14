import 'package:flutter/material.dart';
import '../models/workout.dart';
import 'package:intl/intl.dart';

class WorkoutCard extends StatelessWidget {
  final Workout workout;

  const WorkoutCard({super.key, required this.workout});

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Cardio':
        return Icons.directions_run;
      case 'Strength':
        return Icons.fitness_center;
      case 'Yoga':
        return Icons.self_improvement;
      default:
        return Icons.help_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: ListTile(
        leading: Icon(_getCategoryIcon(workout.category), size: 32),
        title: Text(workout.title),
        subtitle: Text("\${workout.category} - \${workout.duration} mins"),
        trailing: Text(DateFormat('dd MMM').format(workout.date)),
      ),
    );
  }
}