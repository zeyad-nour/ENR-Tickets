import 'dart:developer' show log;

import 'package:enr_tickets/core/utils/colors.dart';
import 'package:enr_tickets/features/home/presentation/view/widgets/dash_custom.dart';
import 'package:enr_tickets/features/home/presentation/view/widgets/selection_station.dart';
import 'package:enr_tickets/features/home/presentation/view/widgets/function_show_stations.dart';
import 'package:flutter/material.dart';

class CustomSelectionView extends StatefulWidget {
  const CustomSelectionView({super.key});

  @override
  State<CustomSelectionView> createState() => _CustomSelectionViewState();
}

class _CustomSelectionViewState extends State<CustomSelectionView> {
  String fromStation = "From Station";
  String toStation = "To Station";
  final List<String> stations = [
    "Cairo",
    "Giza",
    "Alexandria",
    "Tanta",
    "Mansoura",
    "Assiut",
    "Sohag",
    "Qena",
    "Luxor",
    "Aswan",
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            showStationsBottomSheet(
              selectedStation: fromStation,
              context: context,
              stations: stations,
              onStationSelected: (station) {
                setState(() {
                  fromStation = station;
                });
              },
            );
          },
          child: SelectionStation(title: fromStation),
        ),
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
        GestureDetector(
          onTap: () {
            showStationsBottomSheet(
              selectedStation: toStation,
              context: context,
              stations: stations,
              onStationSelected: (station) {
                setState(() {
                  toStation = station;
                });
              },
            );
          },
          child: SelectionStation(title: toStation),
        ),
      ],
    );
  }
}
