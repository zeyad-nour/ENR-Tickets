import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:enr_tickets/core/widget/custom_dialog.dart';
import 'package:enr_tickets/features/payment_way/presentation/view/payment_way.dart';
import 'package:enr_tickets/features/seat_selection/data/model/seatMode.dart';
import 'package:enr_tickets/features/seat_selection/presentation/state_mangement/cubit/seat_selection_cubit.dart';
import 'package:enr_tickets/features/seat_selection/presentation/view/widgets/booking_botton.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeatPage extends StatelessWidget {
  final int trainNumber;
  final String from;
  final String to;

  const SeatPage({
    super.key,
    required this.trainNumber,
    required this.from,
    required this.to,
  });

  int getSeatPrice() {
    if (trainNumber == 185) return 75;
    if (trainNumber == 2009) return 150;
    if (trainNumber == 2031) return 200;
    return 100;
  }

  @override
  Widget build(BuildContext context) {
    const int seatCount = 60;
    const String trainType = "VIP";
    const int coachNumber = 1;

    return BlocBuilder<SeatSelectionCubit, SeatSelectionState>(
      builder: (context, state) {
        if (state is! SeatSelectionLoaded) {
          return const SizedBox();
        }

        final selectedSeats = state.seats
            .where((seat) => seat.status == SeatStatus.selected)
            .toList();

        final totalPrice = selectedSeats.length * getSeatPrice();

        return Column(
          children: [
            if (selectedSeats.isNotEmpty)
              Text(
                "Total: $totalPrice EGP",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            const SizedBox(height: 10),
            BookingBotton(
              onPressed: () {
                if (selectedSeats.isEmpty) {
                  CustomDialog.show(
                    context: context,
                    title: "Noticeable",
                    description: "You must choose your seat first.",
                    dialogType: DialogType.noHeader,
                  );
                } else {
                  CustomDialog.show(
                    context: context,
                    title: "Alert",
                    description: "Are you sure about this booking?",
                    dialogType: DialogType.noHeader,
                    btnOkOnPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PaymentWay(
                            train: trainNumber.toString(),
                            trainType: trainType,
                            coach: coachNumber.toString(),
                            seats: selectedSeats,
                            from: from,
                            to: to,
                            price: totalPrice.toString(),
                            name: "Passenger",
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }
}
