// lib/coach/settings_screen.dart

import 'package:flutter/material.dart';

class CoachSettingsScreen extends StatelessWidget {
  const CoachSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSettingsHeader('Account'),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Edit Profile'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // TODO: الانتقال إلى صفحة تعديل الملف الشخصي
            },
          ),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('Change Password'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // TODO: الانتقال إلى صفحة تغيير كلمة المرور
            },
          ),
          _buildSettingsHeader('App Settings'),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // TODO: الانتقال إلى صفحة إعدادات الإشعارات
            },
          ),
          ListTile(
            leading: const Icon(Icons.color_lens),
            title: const Text('Theme'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // TODO: تغيير الثيم
            },
          ),
          _buildSettingsHeader('Help & Support'),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text('Help Center'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // TODO: الانتقال إلى صفحة المساعدة
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About App'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // TODO: الانتقال إلى صفحة عن التطبيق
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }
}