import 'package:enr_tickets/core/widget/styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Steps
        Container(
          alignment: Alignment.center,
          height: MediaQuery.sizeOf(context).height * 0.05,
          color: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "1 Timetable",
                style: Styles.textStyle19.copyWith(color: Colors.white),
              ),
              Gap(10),
              Text(
                "2 Select seat",
                style: Styles.textStyle19.copyWith(color: Colors.white),
              ),
              Gap(10),
              Text(
                "3 Personal",
                style: Styles.textStyle19.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),

        // const SizedBox(height: 15),

        /// Legend
        Container(
          height: MediaQuery.sizeOf(context).height * 0.05,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _legend("Available", Colors.white),
              _legend("Selected", Colors.red),
              _legend("Booked", Colors.black),
            ],
          ),
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
