import 'dart:developer' show log;

import 'package:enr_tickets/core/utils/strings.dart';
import 'package:enr_tickets/core/utils/widget/custom_button_register.dart';
import 'package:enr_tickets/core/utils/widget/styles.dart';
import 'package:enr_tickets/features/home/presentation/view/widgets/custom_home_logo.dart';
import 'package:enr_tickets/features/home/presentation/view/widgets/custom_selection_view.dart';
import 'package:enr_tickets/features/home/presentation/view/widgets/search_results.dart';
import 'package:enr_tickets/features/home/presentation/view/widgets/travel_date_card.dart';
import 'package:enr_tickets/features/home/presentation/view/widgets/trip_type_selector.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String tripType = "roundTrip";
  DateTime travelDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.white,
        body: Column(
          children: [
            CustomHomeLogo(),
            Text(headhomepage, style: Styles.textStyle27),
            CustomSelectionView(),
            Gap(40),
            TravelDateCard(
              title: "Travel Date",
              date: "${travelDate.day}/${travelDate.month}/${travelDate.year}",
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate:
                      travelDate, // هنا التاريخ الابتدائي يكون تاريخ اليوم
                  firstDate: DateTime(2023),
                  lastDate: DateTime(2050),
                );

                if (pickedDate != null) {
                  setState(() {
                    travelDate = pickedDate; // تحديث التاريخ
                  });
                }
              },
            ),
            Gap(20),
            TripTypeSelector(
              selectedType: tripType,
              onChanged: (value) {
                setState(() {
                  tripType = value;
                });
              },
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: VerifyButton(
                title: "Search",
                onTap: () {
                  log("Search");
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => SearchResults(
                  //       date: travelDate,
                  //       fromStation: fromStation,
                  //       toStation: toStation,
                  //       numberofTickets: 30,
                  //     ),
                  //   ),
                  // );
                },
              ),
            ),
            Gap(20),
          ],
        ),
      ),
    );
  }
}
