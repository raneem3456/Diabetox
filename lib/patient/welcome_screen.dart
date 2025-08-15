import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // زر التخطي في أعلى اليمين
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios_rounded),
                  onPressed: () {
                    // يمكنك هنا إضافة كود للانتقال إلى الشاشة التالية
                  },
                ),
              ),

              const SizedBox(height: 16.0), // مسافة بين زر التخطي والصورة

              Image.asset(
                'assets/images/welcome_image.png',
                width: 325,
                height: 320,
              ),

              const SizedBox(height: 32.0),

              // عنوان الترحيب
              const Text(
                'Welcome to Diabetox',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 16.0),

              // وصف التطبيق
              const Text(
                'Manage your diabetes and other health conditions with ease. Get personalized insights, track your progress, and stay connected with your care team.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),

              const Spacer(), // يدفع المحتوى السفلي للأسفل

              // زر "Get Started"
              ElevatedButton(
                onPressed: () {
                  // الانتقال إلى صفحة التسجيل
                  Navigator.of(context).pushNamed('/signup');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF007BFF),
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),

              const SizedBox(height: 12.0),

              // زر "Log In"
              OutlinedButton(
                onPressed: () {
                  // هنا يتم الانتقال إلى صفحة تسجيل الدخول
                  Navigator.of(context).pushNamed('/login');
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  side: const BorderSide(color: Color(0xFF007BFF)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                child: const Text(
                  'Log In',
                  style: TextStyle(fontSize: 18, color: Color(0xFF007BFF)),
                ),
              ),

              const SizedBox(height: 32.0),

              // لوجو التطبيق في الأسفل
              Image.asset(
                'assets/images/logoo.png',
                height: 50,
              ),

              const SizedBox(height: 24.0),
            ],
          ),
        ),
      ),
    );
  }
}