import 'dart:developer' show log;

import 'package:enr_tickets/core/utils/colors.dart';
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
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.grey,
                ),
                child: Icon(Icons.compare_arrows_sharp, color: buttonColor),
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

class DashesCustom extends StatelessWidget {
  const DashesCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2,
      width: MediaQuery.sizeOf(context).width * 0.4,
      color: buttonColor,
    );
  }
}
