// lib/doctor/patient_profile_screen.dart

import 'package:flutter/material.dart';

class PatientProfileScreen extends StatelessWidget {
  final String patientName;

  const PatientProfileScreen({super.key, required this.patientName, required String patientCondition, required String patientImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(patientName),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.phone),
            onPressed: () {
              // TODO: إضافة منطق بدء مكالمة مع المريض
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // صورة المريض وتفاصيله
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/images/sophia_clark.png'), // مثال لصورة
                  ),
                  const SizedBox(height: 16),
                  Text(
                    patientName,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Condition: Diabetes', // يجب أن تكون بيانات ديناميكية
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
            // علامات التبويب والمحتوى الخاص بها
            DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  const TabBar(
                    tabs: [
                      Tab(text: 'Overview'),
                      Tab(text: 'Reports'),
                      Tab(text: 'Meds'),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.6, // ارتفاع ديناميكي
                    child: TabBarView(
                      children: [
                        // محتوى Overview Tab
                        _buildOverviewTabContent(),
                        // محتوى Reports Tab
                        _buildReportsTabContent(),
                        // محتوى Meds Tab
                        _buildMedsTabContent(context),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- دوال بناء محتوى علامات التبويب ---

  Widget _buildOverviewTabContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // قسم المقاييس الصحية
          const Text(
            'Health Metrics',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildMetricItem('Blood Pressure', '120/80 mmHg'),
          _buildMetricItem('Blood Sugar', '110 mg/dL'),
          _buildMetricItem('Weight', '75 kg'),
          const SizedBox(height: 24),
          // قسم التقارير الأخيرة
          const Text(
            'Recent Reports',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildReportItem('Blood Test Results', 'Submitted 2 hours ago'),
          _buildReportItem('Daily Glucose Log', 'Submitted 3 hours ago'),
        ],
      ),
    );
  }

  Widget _buildReportsTabContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildReportItem('Lab Results - Jan 2024', 'Submitted Jan 15, 2024'),
          _buildReportItem('Glucose Log - Feb 2024', 'Submitted Feb 28, 2024'),
          _buildReportItem('Progress Summary', 'Submitted Mar 10, 2024'),
          _buildReportItem('Blood Pressure Readings', 'Submitted Mar 25, 2024'),
        ],
      ),
    );
  }

  Widget _buildMedsTabContent(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Medications',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildMedicationTile('Metformin', '1000mg', 'Twice daily'),
          _buildMedicationTile('Glipizide', '20mg', 'Once daily'),
          const SizedBox(height: 24),
          const Text(
            'Follow-up Schedule',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildFollowUpCard('Next appointment: July 15, 2024'),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // TODO: الانتقال إلى صفحة تعديل خطة العلاج
              },
              child: const Text('Edit Care Plan'),
            ),
          ),
        ],
      ),
    );
  }

  // --- الدوال المساعدة للواجهات الفرعية ---

  Widget _buildMetricItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 16)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildReportItem(String title, String subtitle) {
    return ListTile(
      leading: const Icon(Icons.description, color: Colors.blue),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        // TODO: الانتقال إلى صفحة تفاصيل التقرير
      },
    );
  }

  Widget _buildMedicationTile(String name, String dosage, String schedule) {
    return ListTile(
      leading: const Icon(Icons.medication, color: Colors.blue),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text('$dosage - $schedule'),
    );
  }

  Widget _buildFollowUpCard(String details) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const Icon(Icons.calendar_today, color: Colors.blue),
            const SizedBox(width: 12),
            Text(details),
          ],
        ),
      ),
    );
  }
}