import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline),
            onPressed: () {
              // Handle help button press
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // My Account Section
            _buildSectionTitle(context, 'My Account'),
            const SizedBox(height: 16),
            _buildMyAccountSection(),
            const SizedBox(height: 32),

            // Emergency Contacts Section
            _buildSectionTitle(context, 'Emergency Contacts'),
            const SizedBox(height: 16),
            _buildEmergencyContactsSection(context), // Pass context here
            const SizedBox(height: 32),

            // Notifications Section
            _buildSectionTitle(context, 'Notifications'),
            const SizedBox(height: 16),
            _buildNotificationsSection(),
            const SizedBox(height: 32),

            // Privacy & Data Sharing Section
            _buildSectionTitle(context, 'Privacy & Data Sharing'),
            const SizedBox(height: 16),
            _buildPrivacySection(),
            const SizedBox(height: 32),

            // Language & Theme Section
            _buildSectionTitle(context, 'Language & Theme'),
            const SizedBox(height: 16),
            _buildLanguageAndThemeSection(),
            const SizedBox(height: 32),

            // Help & Support Section
            _buildSectionTitle(context, 'Help & Support'),
            const SizedBox(height: 16),
            _buildHelpAndSupportSection(),
            const SizedBox(height: 32),

            // Emergency Button
            _buildEmergencyButton(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  // Helper Widgets for each section
  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
    );
  }

  Widget _buildMyAccountSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          _buildAccountInfoRow(
            leading: const CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/images/profile.png'), // Replace with your image
            ),
            title: 'Profile Picture',
            trailing: const Text('Edit'),
            onTap: () {},
          ),
          const Divider(height: 1, color: Colors.grey),
          _buildAccountInfoRow(
            title: 'Name',
            value: 'Sophia Carter',
            trailing: const Text('Edit'),
            onTap: () {},
          ),
          const Divider(height: 1, color: Colors.grey),
          _buildAccountInfoRow(
            title: 'Age',
            value: '35',
            trailing: const Text('Edit'),
            onTap: () {},
          ),
          const Divider(height: 1, color: Colors.grey),
          _buildAccountInfoRow(
            title: 'Contact Details',
            value: '+1 (555) 123-4567',
            trailing: const Text('Edit'),
            onTap: () {},
          ),
          const Divider(height: 1, color: Colors.grey),
          _buildAccountInfoRow(
            title: 'Change Password',
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          const Divider(height: 1, color: Colors.grey),
          _buildAccountInfoRow(
            title: 'Delete Account',
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildAccountInfoRow({
    Widget? leading,
    required String title,
    String? value,
    Widget? trailing,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: leading,
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (value != null)
            Text(
              value,
              style: const TextStyle(color: Colors.black54),
            ),
          const SizedBox(width: 8),
          if (trailing != null) trailing,
        ],
      ),
      onTap: onTap,
    );
  }

  Widget _buildEmergencyContactsSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          _buildEmergencyContactRow(name: 'Ethan Harper', onTap: () {}),
          const Divider(height: 1, color: Colors.grey),
          _buildEmergencyContactRow(name: 'Olivia Bennett', onTap: () {}),
          const Divider(height: 1, color: Colors.grey),
          _buildAddContactRow(onTap: () {
            // Navigator.of(context).pushNamed('/add_contact');
          }),
        ],
      ),
    );
  }

  Widget _buildEmergencyContactRow({required String name, required VoidCallback onTap}) {
    return ListTile(
      title: Text(name),
      trailing: const Text('Edit'),
      onTap: onTap,
    );
  }

  Widget _buildAddContactRow({required VoidCallback onTap}) {
    return ListTile(
      leading: const Icon(Icons.add, color: Colors.blue),
      title: const Text('Add Contact', style: TextStyle(color: Colors.blue)),
      onTap: onTap,
    );
  }

  Widget _buildNotificationsSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          _buildNotificationItem(title: 'Medication Reminders', onTap: () {}),
          const Divider(height: 1, color: Colors.grey),
          _buildNotificationItem(title: 'Glucose Level Alerts', onTap: () {}),
          const Divider(height: 1, color: Colors.grey),
          _buildNotificationItem(title: 'General Alerts', onTap: () {}),
        ],
      ),
    );
  }

  Widget _buildNotificationItem({required String title, required VoidCallback onTap}) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.keyboard_arrow_right),
      onTap: onTap,
    );
  }

  Widget _buildPrivacySection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          _buildPrivacyItem(title: 'Health Data Access', onTap: () {}),
          const Divider(height: 1, color: Colors.grey),
          _buildPrivacyItem(title: 'Location Sharing', onTap: () {}),
        ],
      ),
    );
  }

  Widget _buildPrivacyItem({required String title, required VoidCallback onTap}) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.keyboard_arrow_right),
      onTap: onTap,
    );
  }

  Widget _buildLanguageAndThemeSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          _buildLanguageItem(),
          const Divider(height: 1, color: Colors.grey),
          _buildThemeItem(),
        ],
      ),
    );
  }

  Widget _buildLanguageItem() {
    return ListTile(
      title: const Text('Language'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('English', style: TextStyle(color: Colors.black54)),
          const SizedBox(width: 8),
          Icon(Icons.keyboard_arrow_right, color: Colors.grey.shade600),
        ],
      ),
      onTap: () {
        // Handle language selection
      },
    );
  }

  Widget _buildThemeItem() {
    return ListTile(
      title: const Text('Dark Mode'),
      trailing: Switch(
        value: false, // You need to manage this state
        onChanged: (bool value) {
          // Handle dark mode toggle
        },
      ),
    );
  }

  Widget _buildHelpAndSupportSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          _buildHelpItem(title: 'FAQs', onTap: () {}),
          const Divider(height: 1, color: Colors.grey),
          _buildHelpItem(title: 'Contact Support', onTap: () {}),
        ],
      ),
    );
  }

  Widget _buildHelpItem({required String title, required VoidCallback onTap}) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.keyboard_arrow_right),
      onTap: onTap,
    );
  }

  Widget _buildEmergencyButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Handle emergency button press
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text('Emergency', style: TextStyle(color: Colors.white, fontSize: 18)),
      ),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      currentIndex: 4, // Assuming 'Settings' is the last item (index 4)
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard),
          label: 'Dashboard',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.edit),
          label: 'Data Entry',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.fitness_center),
          label: 'Exercises',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: 'Communication',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
      onTap: (index) {
        // Add navigation logic here
        // Example: Navigator.of(context).pushNamed('/route_name');
      },
    );
  }
}