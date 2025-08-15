// connect_device_screen.dart
import 'package:flutter/material.dart';

class ConnectDeviceScreen extends StatelessWidget {
  const ConnectDeviceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Add Device'),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // شريط البحث
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search by name or manufacturer',
                  icon: Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 24),
            // الأجهزة المدعومة
            const Text(
              'Supported Devices',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildDeviceListItem(
              context,
              name: 'Dexcom G6',
              type: 'Continuous Glucose Monitor',
              imagePath: 'assets/images/dexcom_g6.png', // Replace with your asset
            ),
            _buildDeviceListItem(
              context,
              name: 'Dexcom G7',
              type: 'Continuous Glucose Monitor',
              imagePath: 'assets/images/dexcom_g7.png', // Replace with your asset
            ),
            _buildDeviceListItem(
              context,
              name: 'FreeStyle Libre 2',
              type: 'Continuous Glucose Monitor',
              imagePath: 'assets/images/freestyle_libre_2.png', // Replace with your asset
            ),
            _buildDeviceListItem(
              context,
              name: 'FreeStyle Libre 3',
              type: 'Continuous Glucose Monitor',
              imagePath: 'assets/images/freestyle_libre_3.png', // Replace with your asset
            ),
            _buildDeviceListItem(
              context,
              name: 'Contour Next One',
              type: 'Blood Glucose Meter',
              imagePath: 'assets/images/contour_next_one.png', // Replace with your asset
            ),
            _buildDeviceListItem(
              context,
              name: 'Accu-Chek Guide Me',
              type: 'Blood Glucose Meter',
              imagePath: 'assets/images/accu_chek.png', // Replace with your asset
            ),
          ],
        ),
      ),
      // زر Next في الأسفل
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // الانتقال إلى شاشة البحث عن البلوتوث
            Navigator.of(context).pushNamed('/bluetooth_pairing');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text('Next', style: TextStyle(fontSize: 18)),
        ),
      ),
    );
  }

  Widget _buildDeviceListItem(
      BuildContext context, {
        required String name,
        required String type,
        required String imagePath,
      }) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade300, width: 1),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Image.asset(imagePath, width: 48, height: 48),
        title: Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(type),
        onTap: () {
          // يمكن إضافة منطق لاختيار الجهاز هنا
        },
      ),
    );
  }
}