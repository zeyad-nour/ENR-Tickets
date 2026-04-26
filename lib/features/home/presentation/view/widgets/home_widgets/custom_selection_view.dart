import 'dart:developer' show log;

import 'package:enr_tickets/core/utils/colors.dart';
import 'package:enr_tickets/features/home/presentation/view/widgets/home_widgets/dash_custom.dart';
import 'package:enr_tickets/features/home/presentation/view/widgets/home_widgets/selection_station.dart';
import 'package:enr_tickets/features/home/presentation/view/widgets/home_widgets/function_show_stations.dart';
import 'package:flutter/material.dart';

class CustomSelectionView extends StatefulWidget {
  final String fromStation;
  final String toStation;
  final List<String> stations;
  final Function(String from, String to) onStationsChanged;

  const CustomSelectionView({
    super.key,
    required this.fromStation,
    required this.toStation,
    required this.onStationsChanged,
    required this.stations,
  });

  @override
  State<CustomSelectionView> createState() => _CustomSelectionViewState();
}

class _CustomSelectionViewState extends State<CustomSelectionView> {
  late String fromStation;
  late String toStation;

  @override
  void initState() {
    super.initState();
    fromStation = widget.fromStation;
    toStation = widget.toStation;
  }

  void updateStations() {
    widget.onStationsChanged(fromStation, toStation);
  }

  void _openStationsSheet({
    required String selected,
    required Function(String) onSelect,
  }) {
    // 🔥 هنا الحل
    // if (widget.stations.isEmpty) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(
    //       content: Text("No stations found"),
    //     ),
    //   );
    //   return;
    // }

    showStationsBottomSheet(
      selectedStation: selected,
      context: context,
      stations: widget.stations,
      onStationSelected: onSelect,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// FROM
        GestureDetector(
          onTap: () {
            _openStationsSheet(
              selected: fromStation,
              onSelect: (station) {
                setState(() {
                  fromStation = station;
                });
                updateStations();
              },
            );
          },
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, -0.3),
                  end: Offset.zero,
                ).animate(animation),
                child: FadeTransition(opacity: animation, child: child),
              );
            },
            child: SelectionStation(
              key: ValueKey(fromStation),
              title: fromStation,
            ),
          ),
        ),

        /// SWAP
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DashesCustom(),
            GestureDetector(
              onTap: () {
                log("Swap Stations");

                setState(() {
                  final temp = fromStation;
                  fromStation = toStation;
                  toStation = temp;
                });

                updateStations();
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: 37,
                height: 37,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.grey[200],
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.swap_vert,
                  color: buttonColor,
                  size: 30,
                ),
              ),
            ),
            DashesCustom(),
          ],
        ),

        /// TO
        GestureDetector(
          onTap: () {
            _openStationsSheet(
              selected: toStation,
              onSelect: (station) {
                setState(() {
                  toStation = station;
                });
                updateStations();
              },
            );
          },
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 0.3),
                  end: Offset.zero,
                ).animate(animation),
                child: FadeTransition(opacity: animation, child: child),
              );
            },
            child: SelectionStation(
              key: ValueKey(toStation),
              title: toStation,
            ),
          ),
        ),
      ],
    );
  }
}