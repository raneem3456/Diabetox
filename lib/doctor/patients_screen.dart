// lib/doctor/patients_screen.dart

import 'package:flutter/material.dart';
import 'patient_profile_screen.dart'; // تأكد من استيراد هذه الصفحة
import 'chat_screen.dart'; // تأكد من استيراد هذه الصفحة

class PatientsScreen extends StatefulWidget {
  const PatientsScreen({super.key});

  @override
  State<PatientsScreen> createState() => _PatientsScreenState();
}

class _PatientsScreenState extends State<PatientsScreen> {
  final TextEditingController _searchController = TextEditingController();

  // بيانات المرضى الأصلية (يمكن استبدالها ببيانات من قاعدة بيانات)
  final List<Map<String, String>> _allPatients = const [
    {
      'name': 'Ethan Carter',
      'condition': 'Diabetes',
      'image': 'assets/images/ethan_carter.png'
    },
    {
      'name': 'Olivia Bennett',
      'condition': 'Hypertension',
      'image': 'assets/images/olivia_bennett.png'
    },
    {
      'name': 'Noah Thompson',
      'condition': 'Diabetes',
      'image': 'assets/images/noah_thompson.png'
    },
    {
      'name': 'Sophia Harper',
      'condition': 'Asthma',
      'image': 'assets/images/sophia_harper.png'
    },
    {
      'name': 'Liam Foster',
      'condition': 'Diabetes',
      'image': 'assets/images/liam_foster.png'
    },
    {
      'name': 'Ava Mitchell',
      'condition': 'Hypertension',
      'image': 'assets/images/ava_mitchell.png'
    },
    {
      'name': 'Jackson Reed',
      'condition': 'Diabetes',
      'image': 'assets/images/jackson_reed.png'
    },
    {
      'name': 'Isabella Hayes',
      'condition': 'Asthma',
      'image': 'assets/images/isabella_hayes.png'
    },
  ];

  // القائمة التي سيتم عرضها (تتغير عند البحث)
  List<Map<String, String>> _filteredPatients = [];

  @override
  void initState() {
    super.initState();
    _filteredPatients = _allPatients;
    _searchController.addListener(_filterPatients);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // دالة لتصفية قائمة المرضى بناءً على نص البحث
  void _filterPatients() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredPatients = _allPatients.where((patient) {
        return patient['name']!.toLowerCase().contains(query) ||
            patient['condition']!.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patients'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // TODO: الانتقال إلى صفحة إضافة مريض جديد
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search by name or condition',
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'All Patients',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredPatients.length,
              itemBuilder: (context, index) {
                final patient = _filteredPatients[index];
                return _buildPatientTile(
                    context, patient['name']!, patient['condition']!, patient['image']!);
              },
            ),
          ),
        ],
      ),
      // TODO: يمكنك إضافة شريط التنقل السفلي هنا إذا كان مطلوبًا
    );
  }

  Widget _buildPatientTile(
      BuildContext context, String name, String condition, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(imagePath),
        ),
        title: Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(condition),
        onTap: () {
          // الانتقال إلى صفحة بروفايل المريض
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PatientProfileScreen(patientName: name, patientCondition: '', patientImage: '',),
            ),
          );
        },
        trailing: IconButton(
          icon: const Icon(Icons.phone, color: Colors.blue),
          onPressed: () {
            // TODO: إضافة منطق بدء مكالمة
          },
        ),
      ),
    );
  }
}// TODO Implement this library.