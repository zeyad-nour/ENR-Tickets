import 'dart:developer' show log;

import 'package:enr_tickets/core/utils/colors.dart';
import 'package:enr_tickets/features/home/presentation/view/widgets/dash_custom.dart';
import 'package:enr_tickets/features/home/presentation/view/widgets/selection_station.dart';
import 'package:flutter/material.dart';

class CustomSelectionView extends StatelessWidget {
  const CustomSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SelectionStation(title: "From Station"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DashesCustom(),
            GestureDetector(
              onTap: () {
                log("Transaction");
              },
              child: Container(
                width: 37,
                height: 37,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.grey[200],
                ),
                child: Icon(Icons.swap_vert, color: buttonColor, size: 30),
              ),
            ),
            DashesCustom(),
          ],
        ),
        SelectionStation(title: "To Station"),
      ],
    );
  }
}
