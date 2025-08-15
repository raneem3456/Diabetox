// lib/coach/patient_details_screen.dart

import 'package:flutter/material.dart';
import 'chat_screen.dart'; // لتسهيل التنقل إلى شاشة الدردشة
import 'add_exercises_screen.dart'; // لصفحة إضافة التمارين

class PatientDetailsScreen extends StatelessWidget {
  final Map<String, String> patient;

  const PatientDetailsScreen({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(patient['name']!),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.message),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CoachChatScreen(patientName: patient['name']!),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.phone),
            onPressed: () {
              // TODO: إضافة منطق بدء المكالمة
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPatientHeader(),
            const SizedBox(height: 24),
            _buildInfoCard('Condition', patient['condition']!),
            const SizedBox(height: 16),
            _buildInfoCard('Last Checkup', '2 days ago'),
            const SizedBox(height: 24),
            _buildSectionHeader(context, 'Progress & Analytics', Icons.show_chart),
            const SizedBox(height: 16),
            _buildProgressCard('Blood Glucose', '140 mg/dL', Colors.red),
            const SizedBox(height: 12),
            _buildProgressCard('Activity', '8,500 steps', Colors.green),
            const SizedBox(height: 24),
            _buildSectionHeader(context, 'Exercise Plan', Icons.fitness_center, onEditPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AddExercisesScreen(patientName: patient['name']!),
              ));
            }),
            const SizedBox(height: 16),
            _buildExercisePlan(),
          ],
        ),
      ),
    );
  }

  Widget _buildPatientHeader() {
    return Row(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage(patient['image'] ?? 'assets/images/placeholder_patient.png'),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              patient['name']!,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              'Active',
              style: TextStyle(fontSize: 16, color: Colors.green),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoCard(String title, String value) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(title),
        trailing: Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildProgressCard(String title, String value, Color color) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(Icons.circle, color: color),
        title: Text(title),
        trailing: Text(value, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title, IconData icon, {VoidCallback? onEditPressed}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon, size: 24, color: Colors.blue),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        if (onEditPressed != null)
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.grey),
            onPressed: onEditPressed,
          ),
      ],
    );
  }

  Widget _buildExercisePlan() {
    return const Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('No exercises added yet.', style: TextStyle(color: Colors.grey)),
            // TODO: عرض قائمة التمارين المضافة هنا
          ],
        ),
      ),
    );
  }
}

// TODO: قم بإنشاء هذا الويدجت في ملفه الخاص
class CoachChatScreen extends StatelessWidget {
  final String patientName;
  const CoachChatScreen({super.key, required this.patientName});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(patientName)),
      body: const Center(child: Text('Chat screen for coach')),
    );
  }
}