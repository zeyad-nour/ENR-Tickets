
import 'package:enr_tickets/features/home/data/model/station_model/station_model.dart';

import 'package:enr_tickets/features/home/presentation/view/widgets/home_widgets/selection_station.dart';
import 'package:enr_tickets/features/home/presentation/view/widgets/home_widgets/function_show_stations.dart';
import 'package:flutter/material.dart';
class CustomSelectionView extends StatefulWidget {
  final StationModel fromStation;
  final StationModel toStation;
  final List<StationModel> stations;
  final Function(StationModel from, StationModel to) onStationsChanged;

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
  late StationModel fromStation;
  late StationModel toStation;

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
    required StationModel selected,
    required Function(StationModel) onSelect,
  }) {
    if (widget.stations.isEmpty) return;

    showStationsBottomSheet(
      context: context,
      stations: widget.stations,
      selectedStation: selected,
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
                setState(() => fromStation = station);
                updateStations();
              },
            );
          },
          child: SelectionStation(
            key: ValueKey(fromStation.id),
            title: fromStation.name,
          ),
        ),

        /// SWAP
        GestureDetector(
          onTap: () {
            setState(() {
              final temp = fromStation;
              fromStation = toStation;
              toStation = temp;
            });

            updateStations();
          },
          child: const Icon(Icons.swap_vert),
        ),

        /// TO
        GestureDetector(
          onTap: () {
            _openStationsSheet(
              selected: toStation,
              onSelect: (station) {
                setState(() => toStation = station);
                updateStations();
              },
            );
          },
          child: SelectionStation(
            key: ValueKey(toStation.id),
            title: toStation.name,
          ),
        ),
      ],
    );
  }
}