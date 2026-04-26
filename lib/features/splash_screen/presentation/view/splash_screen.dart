import 'dart:async';
import 'dart:ui';

import 'package:enr_tickets/core/widget/assets.dart';
import 'package:enr_tickets/features/home/presentation/view/home_view.dart';
import 'package:enr_tickets/features/splash_screen/presentation/view/wave_painter.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController scaleController;
  late AnimationController waveController;

  late Animation<double> scale;
  late Animation<double> wave;

  int dots = 0;

  @override
  void initState() {
    super.initState();

    scaleController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 900),
    )..repeat(reverse: true);

    waveController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    )..repeat();

    scale = Tween(begin: 0.9, end: 1.1).animate(
      CurvedAnimation(parent: scaleController, curve: Curves.easeInOut),
    );

    wave = Tween(begin: 0.0, end: 1.0).animate(waveController);

    Timer.periodic(Duration(milliseconds: 500), (timer) {
      setState(() {
        dots = (dots + 1) % 4;
      });
    });

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 600),
          pageBuilder: (_, __, ___) => HomeView(),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      );
    });
  }

  String loading() => "Loading" + "." * dots;

  @override
  void dispose() {
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
            builder: (_, __) {
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
                SizedBox(height: 30),
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                  child: Text(
                    loading(),
                    key: ValueKey(dots),
                    style: TextStyle(
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
