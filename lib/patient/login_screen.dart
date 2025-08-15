import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios_rounded),
                  onPressed: () {

                  },
                ),
              ),

              const SizedBox(height: 16.0),


              Image.asset(
                'assets/images/welcome_image.png',
                width: 325,
                height: 250,
              ),

              const SizedBox(height: 32.0),


              const Text(
                'Sign in',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 32.0),


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


              TextField(
                obscureText: true,
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

              const SizedBox(height: 32.0),


              ElevatedButton(
                onPressed: () {

                  Navigator.of(context).pushNamed('/home');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF007BFF),
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                child: const Text(
                  'Sign in',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),

              const SizedBox(height: 24.0),

              // رابط "Don't have an account? Sign up"
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(color: Colors.black54),
                  ),
                  TextButton(
                    onPressed: () {

                      Navigator.of(context).pushNamed('/signup');
                    },
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                        color: Color(0xFF007BFF),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 32.0),


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