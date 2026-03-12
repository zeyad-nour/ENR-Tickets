import 'package:enr_tickets/features/log_in/presentation/view/log_in.dart';
import 'package:enr_tickets/features/log_in/presentation/view/widgets/background_image.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Quicksand"),
      home: BackgroundImage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
