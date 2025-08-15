// lib/coach/dashboard_screen.dart

import 'package:flutter/material.dart';

class CoachDashboardScreen extends StatelessWidget {
  const CoachDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coach Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // TODO: الانتقال إلى صفحة الإشعارات
            },
          ),
        ],
      ),
      drawer: const CoachDrawer(), // يجب أن تقوم بإنشاء هذا الويدجت
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSummarySection(context),
            const SizedBox(height: 24),
            _buildActivePatientsSection(context),
            const SizedBox(height: 24),
            _buildChallengesSection(context),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // TODO: الانتقال إلى صفحة إضافة مريض جديد
        },
        label: const Text('Add New Patient'),
        icon: const Icon(Icons.person_add),
      ),
    );
  }

  Widget _buildSummarySection(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Summary',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSummaryCard(
              icon: Icons.group,
              title: 'Total Patients',
              value: '15',
              color: Colors.blue,
            ),
            const SizedBox(height: 16),
            _buildSummaryCard(
              icon: Icons.emoji_events,
              title: 'Active Challenges',
              value: '4',
              color: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard({required IconData icon, required String title, required String value, required Color color}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 30),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(color: color, fontSize: 16)),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivePatientsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Active Patients',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/coach/patients');
              },
              child: const Text('View All'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        // قائمة وهمية للمرضى النشطين
        _buildPatientCard('Ali Ahmed', 'Glucose: 150 mg/dL', 'assets/images/placeholder_patient.png'),
        const SizedBox(height: 12),
        _buildPatientCard('Fatima Ali', 'Activity: 3,500 steps', 'assets/images/placeholder_patient.png'),
      ],
    );
  }

  Widget _buildPatientCard(String name, String status, String imagePath) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(imagePath),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(status),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          // TODO: الانتقال إلى صفحة تفاصيل المريض
        },
      ),
    );
  }

  Widget _buildChallengesSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Active Challenges',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        // قائمة وهمية للتحديات
        _buildChallengeCard(
          '30-Day Step Challenge',
          '9 patients participating',
          Colors.green.shade100,
          Icons.directions_walk,
          Colors.green,
        ),
        const SizedBox(height: 12),
        _buildChallengeCard(
          'Healthy Eating Week',
          '5 patients participating',
          Colors.purple.shade100,
          Icons.restaurant,
          Colors.purple,
        ),
      ],
    );
  }

  Widget _buildChallengeCard(String title, String subtitle, Color bgColor, IconData icon, Color iconColor) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(subtitle, style: TextStyle(color: iconColor)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// TODO: يجب إنشاء هذا الويدجت في ملف coach_drawer.dart
class CoachDrawer extends StatelessWidget {
  const CoachDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(child: Text('Coach Menu')),
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text('Dashboard'),
            onTap: () => Navigator.of(context).pushReplacementNamed('/coach/dashboard'),
          ),
          ListTile(
            leading: const Icon(Icons.group),
            title: const Text('Patients'),
            onTap: () => Navigator.of(context).pushReplacementNamed('/coach/patients'),
          ),
          ListTile(
            leading: const Icon(Icons.message),
            title: const Text('Chat'),
            onTap: () => Navigator.of(context).pushReplacementNamed('/coach/chat_list'),
          ),
        ],
      ),
    );
  }
}