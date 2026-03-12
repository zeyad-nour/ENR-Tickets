import 'package:enr_tickets/core/utils/colors.dart';
import 'package:enr_tickets/core/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({super.key});
  final double size = 70;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "E",
              style: TextStyle(
                fontSize: size,
                fontWeight: FontWeight.w800,
                color: const Color.fromARGB(255, 194, 28, 28),
              ),
            ),
            Text(
              "N",
              style: TextStyle(
                fontSize: size,
                fontWeight: FontWeight.w800,
                color: iconColor,
              ),
            ),
            Text(
              "R",
              style: TextStyle(
                fontSize: size,
                fontWeight: FontWeight.w800,
                color: mainfontcolor,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(width: 40, height: 2, color: iconColor),
            Gap(10),
            Text(
              eNR,
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w900,
                color: const Color.fromARGB(255, 194, 28, 28),
              ),
            ),
            Gap(10),
            Container(width: 40, height: 2, color: iconColor),
          ],
        ),
      ],
    );
  }
}
