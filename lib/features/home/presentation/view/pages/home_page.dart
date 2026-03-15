import 'dart:developer' show log;

import 'package:enr_tickets/core/utils/strings.dart';
import 'package:enr_tickets/core/utils/widget/custom_button_register.dart';
import 'package:enr_tickets/core/utils/widget/styles.dart';
import 'package:enr_tickets/features/home/presentation/view/pages/search_results_page.dart';
import 'package:enr_tickets/features/home/presentation/view/widgets/custom_home_logo.dart';
import 'package:enr_tickets/features/home/presentation/view/widgets/custom_selection_view.dart';
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
  ////////////////////////////////
  String fromStation = "From Station";
  String toStation = "To Station";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            CustomHomeLogo(),
            Text(headhomepage, style: Styles.textStyle27),
            CustomSelectionView(
  fromStation: fromStation,
  toStation: toStation,
  onStationsChanged: (from, to) {
    setState(() {
      fromStation = from;
      toStation = to;
    });
  },
),
            Gap(40),
            //Select tady Date
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
            //chose oneway or Round Trip
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
             
                  if (fromStation != "From Station" &&
                      toStation != "To Station") {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SearchResultsPage(),
                      ),
                    );
                  } else {
                    showBottomSheet(
                      context: context,
                      builder: (context) =>
                          Text("Pleace chose Stations correctly"),
                    );
                  }
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
