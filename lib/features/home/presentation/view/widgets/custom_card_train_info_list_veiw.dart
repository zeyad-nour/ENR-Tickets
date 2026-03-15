// ignore_for_file: avoid_print


import 'package:enr_tickets/features/home/presentation/view/widgets/custom_card_train_info.dart';
import 'package:flutter/material.dart';

class CustomCardTrainInfoListVeiw extends StatelessWidget {
  const CustomCardTrainInfoListVeiw({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
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
