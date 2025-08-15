// lib/doctor/communication_screen.dart

import 'package:flutter/material.dart';

class CommunicationScreen extends StatelessWidget {
  const CommunicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Communication'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.phone),
            onPressed: () {
              // TODO: إضافة منطق بدء مكالمة جديدة
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // قسم المحادثات
            _buildChatsSection(context),
            const SizedBox(height: 24),

            // قسم المواعيد القادمة
            _buildUpcomingAppointments(),
            const SizedBox(height: 24),

            // قسم مجموعات الدعم
            _buildSupportGroups(),
            const SizedBox(height: 24),

            // القسم الجديد: التحديات المخصصة للمرضى
            _buildAssignedChallenges(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  // --- Widgets for each section ---

  Widget _buildChatsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildChatTile(
          context,
          'Dr. Emily Carter',
          'Doctor',
          'assets/images/emily_carter.png',
        ),
        _buildChatTile(
          context,
          'Sarah Bennett',
          'Nutritionist',
          'assets/images/sarah_bennett.png',
        ),
        _buildChatTile(
          context,
          'Mark Thompson',
          'Family',
          'assets/images/mark_thompson.png',
        ),
        _buildChatTile(
          context,
          'Care Team',
          'Group Chat',
          'assets/images/care_team.png',
          isGroup: true,
        ),
      ],
    );
  }

  Widget _buildChatTile(BuildContext context, String name, String subtitle, String imagePath, {bool isGroup = false}) {
    return ListTile(
      leading: CircleAvatar(
        radius: 28,
        backgroundImage: AssetImage(imagePath),
      ),
      title: Text(
        name,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(subtitle),
      onTap: () {
        Navigator.of(context).pushNamed('/doctor/chat', arguments: name);
      },
    );
  }

  Widget _buildUpcomingAppointments() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Upcoming Appointments',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        _buildAppointmentCard(
          'Sophia Bennett',
          'Follow-up',
          'July 15, 2024',
          '2:00 PM',
          'assets/images/sophia_bennett.png',
        ),
        const SizedBox(height: 12),
        _buildAppointmentCard(
          'Ethan Carter',
          'Nutrition Plan',
          'July 20, 2024',
          '10:00 AM',
          'assets/images/ethan_carter.png',
        ),
      ],
    );
  }

  Widget _buildAppointmentCard(String name, String topic, String date, String time, String imagePath) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage(imagePath),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                    'Topic: $topic • Date: $date • Time: $time',
                    style: const TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // TODO: إضافة منطق الانضمام للمكالمة
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Join', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSupportGroups() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Support Groups',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        _buildGroupTile('Diabetes Support Group'),
        _buildGroupTile('Heart Health Group'),
      ],
    );
  }

  Widget _buildGroupTile(String groupName) {
    return ListTile(
      leading: const Icon(Icons.people, color: Colors.blue, size: 30),
      title: Text(groupName, style: const TextStyle(fontWeight: FontWeight.bold)),
      onTap: () {
        // TODO: الانتقال إلى صفحة مجموعة الدعم
      },
    );
  }

  Widget _buildAssignedChallenges() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Assigned Challenges',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        _buildChallengeProgressTile('Sophia Bennett', '2-Week Blood Sugar Challenge', 0.6),
        _buildChallengeProgressTile('Ethan Carter', 'Walking Challenge', 0.8),
        _buildChallengeProgressTile('Olivia Bennett', 'Healthy Eating Plan', 0.4),
      ],
    );
  }

  Widget _buildChallengeProgressTile(String patientName, String challengeName, double progress) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: ListTile(
        leading: const CircleAvatar(
          child: Icon(Icons.fitness_center),
        ),
        title: Text(patientName, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(challengeName),
            const SizedBox(height: 4),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[300],
              color: Colors.green,
            ),
          ],
        ),
        trailing: Text('${(progress * 100).toInt()}%'),
        onTap: () {
          // TODO: الانتقال إلى صفحة تفاصيل التحدي
        },
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      currentIndex: 3, // 'Communication' is the fourth item
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Patients'),
        BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Schedule'),
        BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Communication'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      ],
      onTap: (index) {
        // TODO: Handle navigation based on the index
      },
    );
  }
}