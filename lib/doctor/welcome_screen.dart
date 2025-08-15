// lib/welcome_screen.dart

import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  // دالة وهمية لجلب اسم المستخدم من قاعدة البيانات
  Future<String> _fetchUserName() async {
    // محاكاة لعملية جلب البيانات من السيرفر
    await Future.delayed(const Duration(seconds: 2));
    return 'Dr. Ahmed'; // يمكن استبدالها بالاسم الفعلي
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<String>(
          future: _fetchUserName(),
          builder: (context, snapshot) {
            // إذا كانت البيانات قيد التحميل
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            // إذا كان هناك خطأ في جلب البيانات
            if (snapshot.hasError) {
              return const Center(child: Text('Failed to load user data.'));
            }
            // عند اكتمال التحميل ووجود بيانات
            if (snapshot.hasData) {
              final userName = snapshot.data;
              return _buildContent(context, userName!);
            }
            // في حالة عدم وجود أي بيانات
            return const Center(child: Text('No user data available.'));
          },
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, String userName) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // العنوان الرئيسي مع اسم المستخدم الديناميكي
          Text(
            'Welcome, $userName!',
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          // الوصف
          const Text(
            'Start managing your patients\' health efficiently and effectively.',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black54,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48),
          // صورة توضيحية
          Image.asset(
            'assets/images/doctor_welcome_tablet.png',
            height: 250,
          ),
          const SizedBox(height: 48),
          // زر "البدء"
          ElevatedButton(
            onPressed: () {
              // TODO: أضف منطق الانتقال إلى لوحة التحكم الرئيسية
              Navigator.of(context).pushReplacementNamed('/doctor/dashboard');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Get Started',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}