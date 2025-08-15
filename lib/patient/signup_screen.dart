import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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

              const SizedBox(height: 16.0),

              // صورة مجموعة الأشخاص
              Image.asset(
                'assets/images/welcome_image.png',
                width: 325,
                height: 250,
              ),

              const SizedBox(height: 32.0),

              // عنوان "Sign up"
              const Text(
                'Sign up',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 32.0),

              // حقل الإدخال "Email"
              TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 16.0),

              // حقل الإدخال "Password"
              TextField(
                obscureText: true, // لإخفاء كلمة المرور
                decoration: InputDecoration(
                  hintText: 'Password',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 16.0),

              // حقل الإدخال "Confirm Password"
              TextField(
                obscureText: true, // لإخفاء كلمة المرور
                decoration: InputDecoration(
                  hintText: 'Confirm Password',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 32.0),

              // زر "Sign up"
              ElevatedButton(
                onPressed: () {
                  // الانتقال إلى صفحة جمع البيانات
                  Navigator.of(context).pushNamed('/user_data');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF007BFF),
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                child: const Text(
                  'Sign up',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),

              const SizedBox(height: 24.0),

              // رابط "Already have an account? Sign in"
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
                    style: TextStyle(color: Colors.black54),
                  ),
                  TextButton(
                    onPressed: () {
                      // الانتقال إلى صفحة تسجيل الدخول
                      Navigator.of(context).pushNamed('/login');
                    },
                    child: const Text(
                      'Sign in',
                      style: TextStyle(
                        color: Color(0xFF007BFF),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
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