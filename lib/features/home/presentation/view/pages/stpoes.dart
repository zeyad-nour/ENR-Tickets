import 'package:enr_tickets/features/home/presentation/view/widgets/stops_widsgets/station_time_line.dart';
import 'package:flutter/material.dart';

class Stpoes extends StatelessWidget {
  final int stops;
  const Stpoes({super.key, required this.stops});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> trains = [
      {
        "number": "185",
        "type": "ثالثة مكيفة",
        "from": "Cairo",
        "to": "Sohag",
        "depart": "00:05",
        "arrive": "08:45",
        "seats": "32",
        "stops": "9",
        "stations": [
          "Cairo",
          "Giza",
          "Beni Suef",
          "Maghagha",
          "Minya",
          "Malawi",
          "Deirut",
          "Asyut",
          "Tema",
          "Tahta",
          "Sohag",
        ],
      },

      {
        "number": "2009",
        "type": "أولى مكيفة",
        "from": "Cairo",
        "to": "Sohag",
        "depart": "02:35",
        "arrive": "06:40",
        "seats": "13",
        "stops": "4",
        "stations": ["Cairo", "Giza", "Beni Suef", "Minya", "Asyut", "Sohag"],
      },

      {
        "number": "2031",
        "type": "ثانية مكيفة",
        "from": "Cairo",
        "to": "Sohag",
        "depart": "00:45",
        "arrive": "07:05",
        "seats": "4",
        "stops": "6",
        "stations": [
          "Cairo",
          "Giza",
          "Beni Suef",
          "Maghagha",
          "Minya",
          "Asyut",
          "Sohag",
        ],
      },
    ];

    return Scaffold(
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          var train = trains[index];

          return ExpansionTile(
            title: Text(
              "$stops Stops",
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),

            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: StationTimeline(
                  stations: List<String>.from(train["stations"]),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

