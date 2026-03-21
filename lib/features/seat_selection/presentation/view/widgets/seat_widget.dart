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
    Color iconColor;

    switch (state) {
      case SeatState.available:
        iconColor = Colors.grey.shade300;
        break;
      case SeatState.selected:
        iconColor = Colors.red;
        break;
      case SeatState.booked:
        iconColor = Colors.black;
        break;
    }

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 50,
        height: 50,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Icon(Icons.event_seat, size: 40, color: iconColor),
            Text(
              number.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: state == SeatState.available
                    ? Colors.black
                    : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
