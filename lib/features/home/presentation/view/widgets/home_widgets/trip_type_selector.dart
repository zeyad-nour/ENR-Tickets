// ignore_for_file: deprecated_member_use

import 'package:enr_tickets/core/utils/colors.dart';
import 'package:flutter/material.dart';

class TripTypeSelector extends StatelessWidget {
  final String selectedType;
  final Function(String) onChanged;

  const TripTypeSelector({
    super.key,
    required this.selectedType,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            const Text("One Way", style: TextStyle(fontSize: 14)),
            Radio<String>(
              value: "oneWay",
              groupValue: selectedType,
              activeColor: buttonColor,
              onChanged: (value) {
                onChanged(value!);
              },
            ),
          ],
        ),

        const SizedBox(width: 20),

        Row(
          children: [
            const Text("Round Trip", style: TextStyle(fontSize: 14)),
            Radio<String>(
              value: "roundTrip",
              groupValue: selectedType,
              activeColor: buttonColor,
              onChanged: (value) {
                onChanged(value!);
              },
            ),
          ],
        ),
      ],
    );
  }
}
