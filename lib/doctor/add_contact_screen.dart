// lib/patient/add_contact_screen.dart

import 'package:flutter/material.dart';

class AddContactScreen extends StatefulWidget {
  const AddContactScreen({super.key});

  @override
  State<AddContactScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  // بيانات وهمية لجميع جهات الاتصال المتاحة
  final List<Map<String, String>> _allContacts = const [
    {'name': 'Dr. Emily Carter', 'type': 'Doctor', 'image': 'assets/images/emily_carter.png'},
    {'name': 'Ahmed Ali', 'type': 'Family Member', 'image': 'assets/images/ahmed_ali.png'},
    {'name': 'Fatima Hassan', 'type': 'Caregiver', 'image': 'assets/images/fatima_hassan.png'},
    {'name': 'Dr. Alaa Mohamed', 'type': 'Doctor', 'image': 'assets/images/alaa_mohamed.png'},
    {'name': 'Omar Sami', 'type': 'Friend', 'image': 'assets/images/omar_sami.png'},
  ];

  // القائمة التي سيتم عرضها (تتغير عند البحث)
  List<Map<String, String>> _filteredContacts = [];

  @override
  void initState() {
    super.initState();
    // عند فتح الصفحة، نعرض جميع جهات الاتصال
    _filteredContacts = _allContacts;
  }

  // دالة البحث
  void _filterContacts(String query) {
    List<Map<String, String>> results = [];
    if (query.isEmpty) {
      results = _allContacts;
    } else {
      results = _allContacts
          .where((contact) =>
      contact['name']!.toLowerCase().contains(query.toLowerCase()) ||
          contact['type']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    setState(() {
      _filteredContacts = results;
    });
  }

  // دالة لإضافة جهة اتصال مع مؤشر تحميل
  void _addContact(String contactName) async {
    // محاكاة لعملية إضافة تستغرق وقتاً
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Adding $contactName...')),
    );
    await Future.delayed(const Duration(seconds: 1));

    // بعد الإضافة، نظهر رسالة نجاح
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$contactName added successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Contact'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // شريط البحث الديناميكي
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: _filterContacts,
              decoration: InputDecoration(
                hintText: 'Search contacts...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey.shade200,
              ),
            ),
          ),

          // قائمة جهات الاتصال المفلترة
          Expanded(
            child: ListView.builder(
              itemCount: _filteredContacts.length,
              itemBuilder: (context, index) {
                final contact = _filteredContacts[index];
                return _buildAvailableContactTile(
                  context,
                  contact['name']!,
                  contact['type']!,
                  contact['image']!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvailableContactTile(
      BuildContext context,
      String name,
      String type,
      String imagePath,
      ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0, left: 16.0, right: 16.0),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(imagePath),
        ),
        title: Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(type),
        trailing: IconButton(
          icon: const Icon(Icons.add_circle, color: Colors.blue, size: 30),
          onPressed: () {
            _addContact(name); // استدعاء دالة الإضافة
          },
        ),
      ),
    );
  }
}