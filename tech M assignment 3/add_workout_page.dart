import 'package:flutter/material.dart';
import '../models/workout.dart';

class AddWorkoutPage extends StatefulWidget {
  final Function(Workout) onAdd;

  const AddWorkoutPage({super.key, required this.onAdd});

  @override
  State<AddWorkoutPage> createState() => _AddWorkoutPageState();
}

class _AddWorkoutPageState extends State<AddWorkoutPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _durationController = TextEditingController();
  String _selectedCategory = 'Cardio';
  DateTime _selectedDate = DateTime.now();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final newWorkout = Workout(
        title: _titleController.text,
        category: _selectedCategory,
        duration: int.parse(_durationController.text),
        date: _selectedDate,
      );

      widget.onAdd(newWorkout);
      Navigator.pop(context);
    }
  }

  void _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2023),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _durationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Workout')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Workout Title'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a title' : null,
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                items: ['Cardio', 'Strength', 'Yoga']
                    .map((cat) => DropdownMenuItem(
                          value: cat,
                          child: Text(cat),
                        ))
                    .toList(),
                onChanged: (value) {
                  if (value != null) setState(() => _selectedCategory = value);
                },
                decoration: InputDecoration(labelText: 'Category'),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _durationController,
                decoration: InputDecoration(labelText: 'Duration (minutes)'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value!.isEmpty ? 'Enter duration in minutes' : null,
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "Date: \${_selectedDate.day}/\${_selectedDate.month}/\${_selectedDate.year}",
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: _pickDate,
                    child: Text("Choose Date"),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Save Workout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}