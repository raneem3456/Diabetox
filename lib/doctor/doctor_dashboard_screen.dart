// lib/doctor/doctor_dashboard_screen.dart

import 'package:flutter/material.dart';
import 'doctor_drawer.dart'; // تأكد من استيراد ملف الدرج
import 'settings_screen.dart'; // تأكد من استيراد صفحة الإعدادات
import 'patient_profile_screen.dart'; // تأكد من استيراد صفحة بروفايل المريض

class DoctorDashboardScreen extends StatelessWidget {
  const DoctorDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: const Text('Dashboard'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SettingsScreen(),
                ),
              );
            },
          ),
        ],
      ),
      drawer: const DoctorDrawer(), // ربط مباشر مع الـ Drawer
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSummaryCards(),
            const SizedBox(height: 24),
            _buildSectionTitle('Patient Cards'),
            _buildPatientCards(context),
            const SizedBox(height: 24),
            _buildSectionTitle('Recent Reports'),
            _buildRecentReports(context),
            const SizedBox(height: 24),
            _buildSectionTitle('Patient Challenges'),
            _buildPatientChallenges(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  // دالة مساعدة لعنوان القسم
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildSummaryCards() {
    return Row(
      children: [
        Expanded(
          child: _buildSummaryCard(
            title: 'Total Patients',
            value: '250',
            icon: Icons.people_outline,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildSummaryCard(
            title: 'Upcoming Appointments',
            value: '15',
            icon: Icons.calendar_today_outlined,
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryCard({required String title, required String value, required IconData icon}) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(icon, size: 24, color: Colors.blue),
                const SizedBox(width: 8),
                Text(
                  value,
                  style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPatientCards(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildPatientCard(context, 'Sophia Clark', 'Blood Pressure: 120/80', 'assets/images/sophia_clark.png'),
          const SizedBox(width: 12),
          _buildPatientCard(context, 'Ethan Carter', 'Blood Pressure: 130/85', 'assets/images/ethan_carter.png'),
          const SizedBox(width: 12),
          _buildPatientCard(context, 'Olivia Bennett', 'Blood Pressure: 125/75', 'assets/images/olivia_bennett.png'),
        ],
      ),
    );
  }

  Widget _buildPatientCard(BuildContext context, String name, String status, String imagePath) {
    return InkWell(
      onTap: () {
        // الانتقال إلى صفحة تفاصيل المريض
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PatientProfileScreen(patientName: name, patientCondition: '', patientImage: '',),
          ),
        );
      },
      child: Container(
        width: 140,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(imagePath),
            ),
            const SizedBox(height: 8),
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              status,
              style: const TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentReports(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildReportTile(context, 'Sophia Clark', 'Submitted 2 hours ago', 'assets/images/sophia_clark.png'),
        _buildReportTile(context, 'Ethan Carter', 'Submitted 3 hours ago', 'assets/images/ethan_carter.png'),
        _buildReportTile(context, 'Olivia Bennett', 'Submitted 4 hours ago', 'assets/images/olivia_bennett.png'),
      ],
    );
  }

  Widget _buildReportTile(BuildContext context, String name, String status, String imagePath) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(imagePath),
      ),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(status),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        // TODO: الانتقال إلى صفحة التقرير مع تمرير بيانات التقرير
      },
    );
  }

  Widget _buildPatientChallenges() {
    return SizedBox(
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildChallengeCard('Walking Challenge', 'Encourage daily steps', Colors.green.shade100),
          const SizedBox(width: 12),
          _buildChallengeCard('Healthy Eating', 'Suggest new recipes', Colors.blue.shade100),
          const SizedBox(width: 12),
          _buildChallengeCard('Mindful Meds', 'Track medication adherence', Colors.purple.shade100),
        ],
      ),
    );
  }

  Widget _buildChallengeCard(String title, String description, Color color) {
    return Container(
      width: 180,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              // TODO: إضافة منطق لإدارة هذا التحدي
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16),
            ),
            child: const Text('Manage', style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
    );
  }

  // دالة مساعدة لشريط التنقل السفلي (Bottom Navigation Bar)
  Widget _buildBottomNavBar(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      currentIndex: 0, // لوحة التحكم هي أول عنصر
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Patients'),
        BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Schedule'),
        BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      ],
      onTap: (index) {
        // TODO: تنفيذ الانتقال بين الصفحات بناءً على الـ index
      },
    );
  }
}