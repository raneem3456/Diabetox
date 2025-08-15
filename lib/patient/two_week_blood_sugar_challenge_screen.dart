import 'package:flutter/material.dart';

class TwoWeekBloodSugarChallengeScreen extends StatelessWidget {
  const TwoWeekBloodSugarChallengeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('2-Week Blood Sugar Challenge'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Challenge Progress',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const LinearProgressIndicator(
              value: 0.5, // قيمة وهمية للتقدم
              backgroundColor: Colors.grey,
              color: Colors.blue,
              minHeight: 10,
            ),
            const SizedBox(height: 8),
            const Text('Day 7 of 14'),
            const SizedBox(height: 24),
            _buildDailyGoal(
              title: 'Check blood sugar',
              description: '3 times daily (before breakfast, lunch, and dinner)',
              isCompleted: true,
            ),
            _buildDailyGoal(
              title: 'Log all meals',
              description: 'Record everything you eat and drink',
              isCompleted: false,
            ),
            _buildDailyGoal(
              title: 'Daily 15-minute walk',
              description: 'Maintain an active lifestyle',
              isCompleted: false,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDailyGoal({
    required String title,
    required String description,
    required bool isCompleted,
  }) {
    return ListTile(
      leading: Icon(
        isCompleted ? Icons.check_circle : Icons.circle_outlined,
        color: isCompleted ? Colors.green : Colors.grey,
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(description),
    );
  }
}