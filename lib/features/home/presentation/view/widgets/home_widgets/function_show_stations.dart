import 'package:enr_tickets/features/home/data/model/station_model/station_model.dart';
import 'package:enr_tickets/features/home/presentation/view/widgets/home_widgets/field_select_station.dart';
import 'package:enr_tickets/features/home/presentation/view/widgets/home_widgets/stations_list_view.dart';
import 'package:flutter/material.dart';
void showStationsBottomSheet({
  required BuildContext context,
  required List<StationModel> stations,
  required StationModel selectedStation,
  required Function(StationModel) onStationSelected,
}) {
  List<StationModel> filteredStations = List.from(stations);

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Container(
            height: MediaQuery.sizeOf(context).height * 0.75,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              children: [
                /// Search
                SearchField(
                  onChanged: (value) {
                    setState(() {
                      filteredStations = stations
                          .where((station) =>
                              station.name.toLowerCase().contains(
                                    value.toLowerCase(),
                                  ))
                          .toList();
                    });
                  },
                ),

                /// List
                Expanded(
                  child: StationsListView(
                    stations: filteredStations,
                    selectedStation: selectedStation,
                    onStationSelected: onStationSelected,
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