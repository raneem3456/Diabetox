import 'package:flutter/material.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';

class EmergencyCallScreen extends StatefulWidget {
  const EmergencyCallScreen({super.key});

  @override
  _EmergencyCallScreenState createState() => _EmergencyCallScreenState();
}

class _EmergencyCallScreenState extends State<EmergencyCallScreen> {
  int _countdown = 3;
  Timer? _timer;
  final String emergencyPhoneNumber = '911'; // يمكنك تغيير هذا الرقم

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countdown > 1) {
        setState(() {
          _countdown--;
        });
      } else {
        _timer?.cancel();
        _makeEmergencyCall();
      }
    });
  }

  Future<void> _makeEmergencyCall() async {
    final Uri phoneUri = Uri(
      scheme: 'tel',
      path: emergencyPhoneNumber,
    );
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      // إظهار رسالة خطأ في حالة فشل الاتصال
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Could not make a call to the emergency number.'),
        ),
      );
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency Call'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Calling emergency contact in...',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              '$_countdown',
              style: const TextStyle(
                fontSize: 100,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                _timer?.cancel();
                Navigator.pop(context); // إلغاء الاتصال والعودة
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Cancel', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}