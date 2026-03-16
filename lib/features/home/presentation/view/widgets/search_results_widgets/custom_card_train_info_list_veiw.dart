// ignore_for_file: avoid_print

import 'package:enr_tickets/features/home/presentation/view/widgets/search_results_widgets/custom_card_train_info.dart';
import 'package:flutter/material.dart';

class CustomCardTrainInfoListVeiw extends StatelessWidget {
  final int trainNumber;
  final int availableTickets;
  final int stops;
  final String classType;
  final String fromStation;
  final String toStation;
  final String departTime;
  final String arriveTime;
  final String departDate;
  final String arriveDate;
  final String duration;

  const CustomCardTrainInfoListVeiw({
    super.key,
    required this.trainNumber,
    required this.availableTickets,
    required this.stops,
    required this.classType,
    required this.fromStation,
    required this.toStation,
    required this.departTime,
    required this.arriveTime,
    required this.departDate,
    required this.arriveDate,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomCardTrainInfo(
            trainNumber: trainNumber,
            classType: "ثالثة مكيفة (13)",
            fromStation: fromStation,//done
            toStation: toStation,//done
            departTime: departTime,
            arriveTime: arriveTime,
            departDate: departDate,
            arriveDate: arriveDate,
            duration: duration,
            availableTickets: availableTickets,
            stops: 21,
            onBuy: () {
              print("شراء التذكرة");
            },
          ),
          CustomCardTrainInfo(
            trainNumber: 185,
            classType: "ثالثة مكيفة (13)",
            fromStation: "القاهرة",
            toStation: "سوهاج",
            departTime: "08:45",
            arriveTime: "00:05",
            departDate: "2026.02.28",
            arriveDate: "2026.02.28",
            duration: "+02:00",
            availableTickets: 32,
            stops: 21,
            onBuy: () {
              print("شراء التذكرة");
            },
          ),
          CustomCardTrainInfo(
            trainNumber: 185,
            classType: "ثالثة مكيفة (13)",
            fromStation: "القاهرة",
            toStation: "سوهاج",
            departTime: "08:45",
            arriveTime: "00:05",
            departDate: "2026.02.28",
            arriveDate: "2026.02.28",
            duration: "+02:00",
            availableTickets: 32,
            stops: 21,
            onBuy: () {
              print("شراء التذكرة");
            },
          ),
        ],
      ),
    );
  }
}
