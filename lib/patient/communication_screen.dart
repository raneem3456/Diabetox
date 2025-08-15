import 'package:flutter/material.dart';
// تأكدي من أنك تستوردين AppDrawer من نفس ملف HomeScreen أو اجعليه ملفًا منفصلاً
import 'app_drawer.dart';
import 'chat_screen.dart';
import 'home_screen.dart';
// Class for the Contact information
class Contact {
  final String name;
  final String description;
  final String avatarPath;
  final bool isGroupChat;

  Contact({
    required this.name,
    required this.description,
    required this.avatarPath,
    this.isGroupChat = false,
  });
}

// Dummy data for contacts
List<Contact> contacts = [
  Contact(
    name: 'Dr. Emily Carter',
    description: 'Doctor',
    avatarPath: 'assets/images/emily.png', // Replace with your image asset
  ),
  Contact(
    name: 'Sarah Bennett',
    description: 'Nutritionist',
    avatarPath: 'assets/images/sarah.png', // Replace with your image asset
  ),
  Contact(
    name: 'Mark Thompson',
    description: 'Family',
    avatarPath: 'assets/images/mark.png', // Replace with your image asset
  ),
  Contact(
    name: 'Care Team',
    description: 'Group Chat',
    avatarPath: 'assets/images/care_team.png', // Replace with your image asset
    isGroupChat: true,
  ),
];

class CommunicationScreen extends StatelessWidget {
  const CommunicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(), // <--- إضافة السايد بار هنا أيضًا
      appBar: AppBar(
        title: const Text('Communication'),
        centerTitle: false,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.call),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section 1: Contacts
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...contacts.map((contact) => _buildContactItem(context, contact)).toList(),
              ],
            ),
            const SizedBox(height: 24),
            // Section 2: Upcoming Appointments
            const Text(
              'Upcoming Appointments',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildAppointmentCard(
              context,
              name: 'Dr. Emily Carter',
              topic: 'Follow-up',
              date: 'July 15, 2024',
              time: '2:00 PM',
              imagePath: 'assets/images/emily.png',
            ),
            const SizedBox(height: 16),
            _buildAppointmentCard(
              context,
              name: 'Sarah Bennett',
              topic: 'Nutrition Plan',
              date: 'July 20, 2024',
              time: '10:00 AM',
              imagePath: 'assets/images/sarah.png',
            ),
            const SizedBox(height: 24),
            // Section 3: Support Groups
            const Text(
              'Support Groups',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSupportGroupItem(name: 'Diabetes Support Group'),
            _buildSupportGroupItem(name: 'Heart Health Group'),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildContactItem(BuildContext context, Contact contact) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(contact.avatarPath),
      ),
      title: Text(contact.name, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(contact.description),
      trailing: const Icon(Icons.keyboard_arrow_right),
      onTap: () {
        // This is the key part for navigation.
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ChatScreen(contact: contact, chatPartnerName: '',),
          ),
        );
      },
    );
  }

  Widget _buildAppointmentCard(
      BuildContext context, {
        required String name,
        required String topic,
        required String date,
        required String time,
        required String imagePath,
      }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage(imagePath),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text('Topic: $topic', style: const TextStyle(color: Colors.black54)),
                  Text('Date: $date', style: const TextStyle(color: Colors.black54)),
                  Text('Time: $time', style: const TextStyle(color: Colors.black54)),
                ],
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('Join'),
          ),
        ],
      ),
    );
  }

  Widget _buildSupportGroupItem({required String name}) {
    return ListTile(
      leading: const Icon(Icons.people_alt, color: Colors.blue),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
      trailing: const Icon(Icons.keyboard_arrow_right),
      onTap: () {
        // Navigation logic for support groups
      },
    );
  }

  Widget _buildBottomNavBar() {
    // This part should be moved to a separate widget for reusability
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      currentIndex: 3, // Assuming 'Communication' is the 4th item (index 3)
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
    );
  }
}