import 'package:flutter/material.dart';

class PhysicalChallengesScreen extends StatelessWidget {
  const PhysicalChallengesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Physical Challenges'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildPhysicalChallengeItem(
              image: 'assets/images/running.png', // استخدم صورة مناسبة
              title: '30-Day Step Challenge',
              description: 'Walk 10,000 steps daily and track your progress.',
            ),
            _buildPhysicalChallengeItem(
              image: 'assets/images/yoga.png', // استخدم صورة مناسبة
              title: 'Morning Yoga',
              description: 'Start your day with a 15-minute mobility routine.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhysicalChallengeItem({
    required String image,
    required String title,
    required String description,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Image.asset(image, width: 40, height: 40),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        trailing: ElevatedButton(
          onPressed: () {},
          child: const Text('Start'),
        ),
      ),
    );
  }
}