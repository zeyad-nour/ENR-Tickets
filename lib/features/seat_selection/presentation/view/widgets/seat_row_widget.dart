import 'package:enr_tickets/features/seat_selection/presentation/view/widgets/seat_widget.dart';
import 'package:flutter/material.dart';

class SeatRowWidget extends StatelessWidget {
  final int leftStart;
  final int rightStart;

  const SeatRowWidget({
    super.key,
    required this.leftStart,
    required this.rightStart,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// Left seats
        Row(
          children: [
            SeatWidget(number: leftStart, state: SeatState.available, onTap: () {}),
            SeatWidget(number: leftStart + 1, state: SeatState.available, onTap: () {}),
          ],
        ),

        /// aisle
        const SizedBox(width: 40),

        /// Right seats
        Row(
          children: [
            SeatWidget(number: rightStart, state: SeatState.available, onTap: () {}),
            SeatWidget(number: rightStart + 1, state: SeatState.available, onTap: () {}),
          ],
        ),
      ],
    );
  }
}