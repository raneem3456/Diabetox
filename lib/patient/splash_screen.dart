import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'splash_bloc.dart';
import 'splash_event.dart';
import 'splash_state.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, -1.0),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc()..add(AppStarted()),
      child: Scaffold(
        backgroundColor: const Color(0xFFC0E0F7),
        body: BlocListener<SplashBloc, SplashState>(
          listener: (context, state) {
            if (state is SplashLoaded) {
              // هنا يمكنك الانتقال إلى الشاشة التالية بعد انتهاء الحركة
              Navigator.of(context).pushReplacementNamed('/welcome');
            }
          },
          child: Stack(
            children: [
              // اللوجو الثابت في الأسفل
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: Image.asset(
                    'assets/images/logoo.png',
                    width: 120,
                    height: 120,
                  ),
                ),
              ),

              // اللوجو المتحرك في المنتصف
              Align(
                alignment: Alignment.center,
                child: SlideTransition(
                  position: _offsetAnimation,
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 200,
                    height: 200,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}