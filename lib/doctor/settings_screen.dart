// lib/doctor/settings_screen.dart

import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget { // تم تغيير الاسم هنا
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          children: [
            // قسم الحساب (Account Section)
            _buildSettingsSection(
              title: 'Account',
              children: [
                _buildSettingsTile(
                  title: 'Edit Profile',
                  icon: Icons.person_outline,
                  onTap: () {
                    // TODO: الانتقال إلى صفحة تعديل البروفايل
                  },
                ),
                _buildSettingsTile(
                  title: 'Change Password',
                  icon: Icons.lock_outline,
                  onTap: () {
                    // TODO: الانتقال إلى صفحة تغيير كلمة المرور
                  },
                ),
              ],
            ),

            // قسم التفضيلات (Preferences Section)
            _buildSettingsSection(
              title: 'Preferences',
              children: [
                _buildSwitchSettingsTile(
                  title: 'Enable Notifications',
                  icon: Icons.notifications_none,
                  value: true,
                  onChanged: (bool value) {
                    // TODO: حفظ حالة التفعيل
                  },
                ),
                _buildSwitchSettingsTile(
                  title: 'Dark Mode',
                  icon: Icons.dark_mode_outlined,
                  value: false,
                  onChanged: (bool value) {
                    // TODO: تغيير ثيم التطبيق
                  },
                ),
                _buildSettingsTile(
                  title: 'Language',
                  icon: Icons.language_outlined,
                  subtitle: 'English',
                  onTap: () {
                    // TODO: الانتقال إلى صفحة اختيار اللغة
                  },
                ),
              ],
            ),

            // قسم الدعم والمعلومات (Support & Info Section)
            _buildSettingsSection(
              title: 'Support & Info',
              children: [
                _buildSettingsTile(
                  title: 'Help Center',
                  icon: Icons.help_outline,
                  onTap: () {
                    // TODO: فتح مركز المساعدة
                  },
                ),
                _buildSettingsTile(
                  title: 'Privacy Policy',
                  icon: Icons.privacy_tip_outlined,
                  onTap: () {
                    // TODO: فتح صفحة سياسة الخصوصية
                  },
                ),
                _buildSettingsTile(
                  title: 'Terms of Service',
                  icon: Icons.description_outlined,
                  onTap: () {
                    // TODO: فتح صفحة شروط الخدمة
                  },
                ),
              ],
            ),

            const SizedBox(height: 32),

            // زر تسجيل الخروج (Log Out Button)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ElevatedButton(
                onPressed: () {
                  // TODO: إضافة منطق تسجيل الخروج
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.logout, size: 24),
                    SizedBox(width: 8),
                    Text('Log Out', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- الدوال المساعدة ---

  Widget _buildSettingsSection({required String title, required List<Widget> children}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
              const Divider(),
              ...children,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsTile({required String title, required IconData icon, String? subtitle, required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }

  Widget _buildSwitchSettingsTile({
    required String title,
    required IconData icon,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return SwitchListTile(
      secondary: Icon(icon, color: Colors.blue),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      value: value,
      onChanged: onChanged,
      activeColor: Colors.blue,
    );
  }
}