// lib/doctor/patient_details_screen.dart

import 'package:flutter/material.dart';

class PatientDetailsScreen extends StatelessWidget {
  final String patientName;
  final String detailType; // نوع التفاصيل: 'Treatment Plan', 'Create Plan', 'Report Details'

  const PatientDetailsScreen({
    super.key,
    required this.patientName,
    required this.detailType,
  });

  @override
  Widget build(BuildContext context) {
    // تحديد الواجهة التي سيتم عرضها بناءً على نوع التفاصيل
    Widget content;
    switch (detailType) {
      case 'Treatment Plan':
        content = _buildTreatmentPlanView();
        break;
      case 'Create Plan':
        content = _buildCreateNewPlanView();
        break;
      case 'Report Details':
        content = _buildReportDetailsView();
        break;
      default:
        content = const Center(child: Text('Invalid detail type.'));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(detailType),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: content,
      ),
    );
  }

  // --- دوال بناء الواجهات المختلفة ---

  // 1. واجهة عرض خطة العلاج
  Widget _buildTreatmentPlanView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Treatment Plan for $patientName',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 24),

        // قسم الأدوية
        const Text(
          'Medications',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        _buildMedicationItem('Metformin', '1000mg', Icons.medication),
        _buildMedicationItem('Glipizide', '20mg', Icons.medication),
        const SizedBox(height: 24),

        // قسم الجرعات
        const Text(
          'Dosage',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        _buildDosageItem('Metformin', 'Twice daily', Icons.access_time),
        _buildDosageItem('Glipizide', 'Once daily', Icons.access_time),
        const SizedBox(height: 24),

        // قسم جدول المتابعة
        const Text(
          'Follow-up Schedule',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        _buildFollowUpCard('Next appointment: July 15, 2024'),
        const SizedBox(height: 48),

        // الأزرار
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Edit'),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Save'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // 2. واجهة إنشاء خطة علاج جديدة
  Widget _buildCreateNewPlanView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Create New Plan',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        const TextField(
          decoration: InputDecoration(
            hintText: 'Plan Name',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 24),

        const Text(
          'Plan Type',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        _buildPlanTypeCard('Medication Management', 'Treatment Plan', Icons.edit),
        _buildPlanTypeCard('Nutrition Guidance', 'Dietary Plan', Icons.restaurant_menu),
        _buildPlanTypeCard('Physical Therapy', 'Exercise Plan', Icons.fitness_center),
        const SizedBox(height: 48),

        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Text('Save Plan'),
          ),
        ),
      ],
    );
  }

  // 3. واجهة عرض تفاصيل التقرير
  Widget _buildReportDetailsView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Blood Test Results for $patientName',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        const Text(
          'Date: July 10, 2024',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        const SizedBox(height: 24),

        const Text(
          'Results Summary',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        const Text(
          'Here is a detailed summary of the patient\'s blood test results. All values are within the normal range except for blood glucose, which shows a slight elevation. Further monitoring is recommended.',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 24),

        _buildReportSection('Glucose Level', '115 mg/dL', 'Slightly high'),
        _buildReportSection('Cholesterol', '180 mg/dL', 'Normal'),
        const SizedBox(height: 48),

        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Text('Download Full Report'),
          ),
        ),
      ],
    );
  }

  // --- الدوال المساعدة ---

  Widget _buildMedicationItem(String name, String strength, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey, size: 30),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(strength),
    );
  }

  Widget _buildDosageItem(String name, String schedule, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey, size: 30),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(schedule),
    );
  }

  Widget _buildFollowUpCard(String details) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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

  Widget _buildPlanTypeCard(String title, String subtitle, IconData icon) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, size: 30, color: Colors.blue),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          // TODO: تحديد نوع الخطة وتوجيه المستخدم
        },
      ),
    );
  }

  Widget _buildReportSection(String title, String value, String status) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          Row(
            children: [
              Text(value, style: const TextStyle(fontSize: 16)),
              const SizedBox(width: 8),
              Text('($status)', style: const TextStyle(color: Colors.red)),
            ],
          ),
        ],
      ),
    );
  }
}