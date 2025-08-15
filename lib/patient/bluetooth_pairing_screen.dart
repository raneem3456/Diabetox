
import 'package:flutter/material.dart';
import 'dart:async';

class BluetoothPairingScreen extends StatefulWidget {
  const BluetoothPairingScreen({super.key});

  @override
  _BluetoothPairingScreenState createState() => _BluetoothPairingScreenState();
}

class _BluetoothPairingScreenState extends State<BluetoothPairingScreen> {
  bool _isConnecting = true;

  @override
  void initState() {
    super.initState();
    // محاكاة عملية الاتصال لمدة 3 ثوانٍ
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _isConnecting = false;
        });
        // الانتقال إلى شاشة النجاح بعد 2 ثانية
        Timer(const Duration(seconds: 2), () {
          if (mounted) {
            Navigator.of(context).pushNamedAndRemoveUntil(
              '/success_screen',
                  (Route<dynamic> route) => false,
            );
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connecting to Device'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_isConnecting) ...[
                const Icon(Icons.bluetooth_searching, size: 100, color: Colors.blue),
                const SizedBox(height: 24),
                const Text(
                  'Searching for your device...',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const CircularProgressIndicator(),
              ] else ...[
                const Icon(Icons.bluetooth_connected, size: 100, color: Colors.green),
                const SizedBox(height: 24),
                const Text(
                  'Device found! Connecting...',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const LinearProgressIndicator(),
              ],
              const SizedBox(height: 24),
              const Text(
                'Make sure your glucometer is on and close to your phone.',
                style: TextStyle(color: Colors.black54),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}// TODO Implement this library.