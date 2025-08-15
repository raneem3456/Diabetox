// lib/coach/add_exercises_screen.dart

import 'package:flutter/material.dart';

class AddExercisesScreen extends StatefulWidget {
  final String patientName;

  const AddExercisesScreen({super.key, required this.patientName});

  @override
  State<AddExercisesScreen> createState() => _AddExercisesScreenState();
}

class _AddExercisesScreenState extends State<AddExercisesScreen> {
  // قائمة وهمية بالتمارين المتاحة
  final List<Map<String, dynamic>> _availableExercises = [
    {'name': 'Brisk Walking', 'isAdded': false, 'description': '30 mins every day'},
    {'name': 'Light Jogging', 'isAdded': false, 'description': '20 mins, 3 times/week'},
    {'name': 'Strength Training', 'isAdded': false, 'description': '2 times/week'},
    {'name': 'Yoga', 'isAdded': false, 'description': '15 mins every day'},
    {'name': 'Swimming', 'isAdded': false, 'description': '45 mins, 2 times/week'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Exercises for ${widget.patientName}'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _availableExercises.length,
        itemBuilder: (context, index) {
          final exercise = _availableExercises[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              title: Text(exercise['name']),
              subtitle: Text(exercise['description']),
              trailing: IconButton(
                icon: Icon(
                  exercise['isAdded'] ? Icons.check_circle : Icons.add_circle_outline,
                  color: exercise['isAdded'] ? Colors.green : Colors.blue,
                ),
                onPressed: () {
                  setState(() {
                    exercise['isAdded'] = !exercise['isAdded'];
                  });
                },
              ),
              onTap: () {
                // TODO: يمكن عرض تفاصيل التمرين هنا
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // TODO: حفظ التمارين المختارة وإضافتها لخطة المريض
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Exercise plan updated for ${widget.patientName}!'),
            ),
          );
          Navigator.of(context).pop();
        },
        label: const Text('Save Plan'),
        icon: const Icon(Icons.save),
      ),
    );
  }
}