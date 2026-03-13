import 'package:enr_tickets/features/home/presentation/view/widgets/search_field.dart';
import 'package:enr_tickets/features/home/presentation/view/widgets/stations_list_view.dart';
import 'package:flutter/material.dart';


void showStationsBottomSheet({
  required BuildContext context,
  required List<String> stations,
  required String selectedStation,
  required Function(String) onStationSelected,
}) {

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
                SearchField(
                  onChanged: (value) {
                    setState(() {
                    });
                  },
                ),

                /// stations list
                Expanded(
                  child: StationsListView(
                    stations: stations,
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
