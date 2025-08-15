import 'package:flutter/material.dart';

class ChallengesScreen extends StatelessWidget {
  const ChallengesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Challenges'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildChallengeCard(
              context,
              title: 'Blood Sugar Challenge',
              subtitle: 'Control your blood sugar for 2 weeks.',
              icon: Icons.monitor_heart,
              color: Colors.blue.shade100,
              route: '/blood_sugar_challenge',
            ),
            const SizedBox(height: 16),
            _buildChallengeCard(
              context,
              title: 'Nutritional Challenges',
              subtitle: 'Improve your diet with healthy food goals.',
              icon: Icons.local_dining,
              color: Colors.green.shade100,
              route: '/nutritional_challenges',
            ),
            const SizedBox(height: 16),
            _buildChallengeCard(
              context,
              title: 'Physical Challenges',
              subtitle: 'Boost your activity with exercise goals.',
              icon: Icons.fitness_center,
              color: Colors.orange.shade100,
              route: '/physical_challenges',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChallengeCard(
      BuildContext context, {
        required String title,
        required String subtitle,
        required IconData icon,
        required Color color,
        required String route,
      }) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(route);
        },
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            children: [
              Icon(icon, size: 40, color: Colors.black87),
              const SizedBox(width: 24),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(subtitle),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}