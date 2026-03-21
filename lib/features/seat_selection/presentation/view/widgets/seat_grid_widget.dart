import 'package:enr_tickets/features/seat_selection/presentation/view/widgets/seat_row_widget.dart';
import 'package:flutter/material.dart';

class SeatGridWidget extends StatelessWidget {
  const SeatGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(7, (index) {
        int left = index * 4 + 1;
        int right = index * 4 + 3;

        return SeatRowWidget(
          leftStart: left,
          rightStart: right,
        );
      }),
    );
  }
}