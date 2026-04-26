// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'dart:ui';

import 'package:enr_tickets/core/widget/assets.dart';
import 'package:enr_tickets/features/home/presentation/view/home_view.dart';
import 'package:enr_tickets/features/log_in/presentation/view/log_in.dart';
import 'package:enr_tickets/features/splash_screen/presentation/view/wave_painter.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final bool loggedIn;

  const SplashScreen({super.key, required this.loggedIn});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController scaleController;
  late AnimationController waveController;

  late Animation<double> scale;
  late Animation<double> wave;

  late Timer _timer;

  int dots = 0;

  @override
  void initState() {
    super.initState();

    scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat(reverse: true);

    waveController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();

    scale = Tween(begin: 0.9, end: 1.1).animate(
      CurvedAnimation(parent: scaleController, curve: Curves.easeInOut),
    );

    wave = Tween(begin: 0.0, end: 1.0).animate(waveController);

    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      if (!mounted) return;

      setState(() {
        dots = (dots + 1) % 4;
      });
    });

    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      _timer.cancel(); // stope timer when navigating to next screen

      final nextScreen = widget.loggedIn ? const HomeView() : const LogIn();

      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 600),
          pageBuilder: (_, _, _) => nextScreen,
          transitionsBuilder: (_, animation, _, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      );
    });
  }

  String loading() => "Loading${"." * dots}";

  @override
  void dispose() {
    _timer.cancel();
    scaleController.dispose();
    waveController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(AssetsData.splash, fit: BoxFit.cover),

          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
            child: Container(color: Colors.black.withOpacity(0.25)),
          ),

          AnimatedBuilder(
            animation: wave,
            builder: (_, _) {
              return CustomPaint(
                size: Size.infinite,
                painter: WavePainter(wave.value),
              );
            },
          ),

          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ScaleTransition(
                  scale: scale,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.red.withOpacity(0.6),
                          blurRadius: 50,
                          spreadRadius: 10,
                        ),
                      ],
                    ),
                    child: Image.asset(AssetsData.splashTow, width: 170),
                  ),
                ),
                const SizedBox(height: 30),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: Text(
                    loading(),
                    key: ValueKey(dots),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
