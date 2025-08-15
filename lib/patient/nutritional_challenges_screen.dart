import 'package:flutter/material.dart';

class NutritionalChallengesScreen extends StatelessWidget {
  const NutritionalChallengesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nutritional Challenges'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildNutritionalChallengeItem(
              icon: Icons.water_drop,
              title: 'Hydration Challenge',
              description: 'Drink 2 liters of water every day for a week.',
            ),
            _buildNutritionalChallengeItem(
              icon: Icons.ramen_dining,
              title: 'No Sugar Challenge',
              description: 'Avoid all added sugars for 10 days to reset your palate.',
            ),
            _buildNutritionalChallengeItem(
              icon: Icons.local_florist,
              title: 'Eat the Rainbow',
              description: 'Incorporate 5 different colored fruits and vegetables daily.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNutritionalChallengeItem({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.green),
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