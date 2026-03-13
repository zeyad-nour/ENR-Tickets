import 'package:enr_tickets/core/utils/strings.dart';
import 'package:enr_tickets/core/utils/widget/styles.dart';
import 'package:enr_tickets/features/home/presentation/view/widgets/custom_home_logo.dart';
import 'package:enr_tickets/features/home/presentation/view/widgets/custom_selection_view.dart';
import 'package:enr_tickets/features/home/presentation/view/widgets/selection_station.dart';
import 'package:enr_tickets/features/home/presentation/view/widgets/travel_date_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: Column(
          children: [
            CustomHomeLogo(),
            Text(headhomepage, style: Styles.textStyle27),
            CustomSelectionView(),
            Gap(40),
            TravelDateCard(
              title: "Travel Date",
              date: "13/3/2026",
              onTap: () {
                print("object");
              },
            ),
          ],
        ),
      ),
    );
  }
}
