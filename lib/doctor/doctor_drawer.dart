// lib/doctor/doctor_drawer.dart

import 'package:flutter/material.dart';

class DoctorDrawer extends StatelessWidget {
  const DoctorDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // رأس الدرج (Header)
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.white,
                  // صورة الطبيب
                  backgroundImage: AssetImage('assets/images/doctor_avatar.png'),
                ),
                SizedBox(height: 12),
                Text(
                  'Dr. Ahmed', // اسم الطبيب
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Endocrinologist', // تخصص الطبيب
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          // قائمة العناصر
          _buildDrawerItem(
            icon: Icons.dashboard,
            title: 'Dashboard',
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/doctor/dashboard');
            },
          ),
          _buildDrawerItem(
            icon: Icons.people,
            title: 'Patients',
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/doctor/patients');
            },
          ),
          _buildDrawerItem(
            icon: Icons.calendar_today,
            title: 'Schedule',
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/doctor/schedule');
            },
          ),
          _buildDrawerItem(
            icon: Icons.message,
            title: 'Communication',
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/doctor/communication');
            },
          ),
          const Divider(), // فاصل
          _buildDrawerItem(
            icon: Icons.settings,
            title: 'Settings',
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/doctor/settings');
            },
          ),
          _buildDrawerItem(
            icon: Icons.logout,
            title: 'Logout',
            onTap: () {
              // TODO: إضافة منطق تسجيل الخروج
              Navigator.of(context).pushReplacementNamed('/doctor/login');
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title),
      onTap: onTap,
    );
  }
}