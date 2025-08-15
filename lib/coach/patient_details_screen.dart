// lib/coach/client_details_screen.dart

import 'package:flutter/material.dart';

class ClientDetailsScreen extends StatelessWidget {
  // بيانات العميل التي ستمرر إلى هذه الشاشة
  final Map<String, dynamic> clientData;

  const ClientDetailsScreen({super.key, required this.clientData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ملف العميل'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // قسم الصورة والاسم
            _buildProfileSection(clientData),
            const SizedBox(height: 20),

            // قسم المعلومات الأساسية
            _buildInfoCard(
              title: 'المعلومات الأساسية',
              children: [
                _buildInfoRow(Icons.person, 'الاسم', clientData['name']),
                _buildInfoRow(Icons.cake, 'العمر', '${clientData['age']} سنة'),
                _buildInfoRow(Icons.phone, 'رقم الهاتف', clientData['phone']),
                _buildInfoRow(Icons.email, 'البريد الإلكتروني', clientData['email']),
              ],
            ),
            const SizedBox(height: 20),

            // قسم الأهداف التدريبية
            _buildInfoCard(
              title: 'الأهداف التدريبية',
              children: [
                _buildInfoRow(Icons.fitness_center, 'الهدف الرئيسي', clientData['mainGoal']),
                _buildInfoRow(Icons.bar_chart, 'التقدم', clientData['progress']),
              ],
            ),
            const SizedBox(height: 20),

            // قسم ملاحظات المدرب (مكان لكتابة الملاحظات ومتابعة العميل)
            _buildInfoCard(
              title: 'ملاحظات المدرب',
              children: [
                Text(
                  clientData['coachNotes'],
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // الأزرار التفاعلية (للتواصل)
            _buildActionButtons(context, clientData),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection(Map<String, dynamic> data) {
    return Column(
      children: [
        CircleAvatar(
          radius: 60,
          backgroundImage: NetworkImage(data['photoUrl']),
        ),
        const SizedBox(height: 10),
        Text(
          data['name'],
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text(
          data['role'], // "عميل"
          style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
        ),
      ],
    );
  }

  Widget _buildInfoCard({required String title, required List<Widget> children}) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(height: 20, thickness: 1),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue.shade700),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context, Map<String, dynamic> data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton.icon(
          onPressed: () {
            // TODO: إضافة منطق فتح شاشة المحادثة
          },
          icon: const Icon(Icons.message),
          label: const Text('رسالة'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
        ),
        ElevatedButton.icon(
          onPressed: () {
            // TODO: إضافة منطق الاتصال الهاتفي أو مكالمة الفيديو
          },
          icon: const Icon(Icons.videocam),
          label: const Text('مكالمة فيديو'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
        ),
      ],
    );
  }
}

// مثال على كيفية استدعاء هذه الشاشة وتمرير البيانات إليها
// يمكنك وضع هذا الكود في أي مكان آخر في تطبيقك
/*
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => ClientDetailsScreen(
      clientData: {
        'name': 'فاطمة محمد',
        'age': 28,
        'phone': '0551234567',
        'email': 'fatima.mohamed@email.com',
        'photoUrl': 'https://example.com/fatima_mohamed.jpg',
        'role': 'عميل',
        'mainGoal': 'خسارة الوزن وتحديد العضلات',
        'progress': 'تقدم 5 كجم في شهرين',
        'coachNotes': 'تستجيب بشكل جيد لتمارين الكارديو. يجب زيادة الأوزان في تمارين القوة بشكل تدريجي.',
      },
    ),
  ),
);
*/