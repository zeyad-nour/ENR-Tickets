import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Steps
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Text("1 Timetable"),
            Text("2 Select seat"),
            Text("3 Personal"),
          ],
        ),

        const SizedBox(height: 10),

        /// Legend
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _legend("Available", Colors.white),
            _legend("Selected", Colors.red),
            _legend("Booked", Colors.black),
          ],
        ),
      ],
    );
  }

  Widget _legend(String text, Color color) {
    return Row(
      children: [
        Container(
          width: 15,
          height: 15,
          margin: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(),
          ),
        ),
        Text(text),
      ],
    );
  }
}