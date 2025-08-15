// lib/coach/patients_screen.dart

import 'package:flutter/material.dart';

class CoachPatientsScreen extends StatefulWidget {
  const CoachPatientsScreen({super.key});

  @override
  State<CoachPatientsScreen> createState() => _CoachPatientsScreenState();
}

class _CoachPatientsScreenState extends State<CoachPatientsScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, String>> _allPatients = const [
    {'name': 'Ahmed Ali', 'condition': 'Type 1 Diabetes'},
    {'name': 'Layla Mansour', 'condition': 'Gestational Diabetes'},
    {'name': 'Youssef Tariq', 'condition': 'Prediabetes'},
    {'name': 'Nour Khaled', 'condition': 'Type 2 Diabetes'},
  ];

  List<Map<String, String>> _filteredPatients = [];

  @override
  void initState() {
    super.initState();
    _filteredPatients = _allPatients;
    _searchController.addListener(_filterPatients);
  }

  void _filterPatients() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredPatients = _allPatients.where((patient) {
        return patient['name']!.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Patients'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search for a patient...',
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
          Expanded(
            child: ListView.builder(
              itemCount: _filteredPatients.length,
              itemBuilder: (context, index) {
                final patient = _filteredPatients[index];
                return ListTile(
                  leading: const CircleAvatar(
                    // يمكنك استخدام صورة حقيقية للمريض
                    backgroundImage: AssetImage('assets/images/placeholder_patient.png'),
                  ),
                  title: Text(patient['name']!),
                  subtitle: Text(patient['condition']!),
                  onTap: () {
                    // TODO: الانتقال إلى صفحة تفاصيل المريض
                    Navigator.of(context).pushNamed(
                      '/coach/patient_details',
                      arguments: patient,
                    );
                  },
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.message, color: Colors.blue),
                        onPressed: () {
                          // TODO: الانتقال إلى صفحة الدردشة
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.phone, color: Colors.green),
                        onPressed: () {
                          // TODO: إضافة منطق المكالمة
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}