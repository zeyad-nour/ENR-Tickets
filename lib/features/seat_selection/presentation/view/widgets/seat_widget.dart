import 'package:flutter/material.dart';

enum SeatState { available, selected, booked }

class SeatWidget extends StatelessWidget {
  final int number;
  final SeatState state;
  final VoidCallback onTap;

  const SeatWidget({
    super.key,
    required this.number,
    required this.state,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    Color textColor;

    switch (state) {
      case SeatState.available:
        bgColor = Colors.white;
        textColor = Colors.black;
        break;
      case SeatState.selected:
        bgColor = Colors.red;
        textColor = Colors.white;
        break;
      case SeatState.booked:
        bgColor = Colors.black;
        textColor = Colors.white;
        break;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(6),
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300),
          boxShadow: const [
            BoxShadow(
              blurRadius: 5,
              color: Colors.black12,
              offset: Offset(0, 3),
            )
          ],
        ),
        child: Center(
          child: Text(
            number.toString(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}