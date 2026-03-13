import 'package:enr_tickets/core/utils/colors.dart';
import 'package:flutter/material.dart';

void showStationsBottomSheet({
  required BuildContext context,
  required List<String> stations,
  required Function(String) onStationSelected,
}) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return ListView.builder(
        itemCount: stations.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(stations[index]),
            leading: Icon(Icons.train_outlined, color: iconColor),
            onTap: () {
              onStationSelected(stations[index]);
              Navigator.pop(context);
            },
          );
        },
      );
    },
  );
}
