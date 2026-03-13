import 'package:enr_tickets/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:enr_tickets/core/utils/widget/assets.dart';
import 'package:enr_tickets/core/utils/widget/styles.dart';

void showStationsBottomSheet({
  required BuildContext context,
  required List<String> stations,
  required String selectedStation,
  required Function(String) onStationSelected,
}) {
  List<String> filteredStations = stations;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.75,
            child: Column(
              children: [
                /// search field
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search station...",
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        filteredStations = stations
                            .where(
                              (station) => station.toLowerCase().contains(
                                value.toLowerCase(),
                              ),
                            )
                            .toList();
                      });
                    },
                  ),
                ),

                /// stations list
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredStations.length,
                    itemBuilder: (context, index) {
                      final station = filteredStations[index];

                      return Card(
                        color: Colors.white,
                        child: ListTile(
                          title: Text(station, style: Styles.textStyle20),

                          leading: Image.asset(
                            AssetsData.icontravel,
                            width: 30,
                          ),

                          /// علامة الصح
                          trailing: station == selectedStation
                              ? const Icon(Icons.check, color: buttonColor)
                              : null,

                          onTap: () {
                            onStationSelected(station);
                            Navigator.pop(context);
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
