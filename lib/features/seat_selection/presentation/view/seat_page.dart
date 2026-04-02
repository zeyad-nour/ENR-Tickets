import 'package:enr_tickets/features/seat_selection/data/model/seatMode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:enr_tickets/features/seat_selection/presentation/state_mangement/cubit/seat_selection_cubit.dart';
import 'package:enr_tickets/features/seat_selection/presentation/view/widgets/seat_grid_widget.dart';
import 'package:enr_tickets/features/seat_selection/presentation/view/widgets/header_widget.dart';
import 'package:enr_tickets/features/seat_selection/presentation/view/widgets/booking_botton.dart';
import 'package:enr_tickets/core/widget/custom_dialog.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:enr_tickets/features/payment_way/presentation/view/payment_way.dart';

class SeatPage extends StatefulWidget {
  final int trainNumber;
  final String from;
  final String to;

  const SeatPage({
    super.key,
    required this.trainNumber,
    required this.from,
    required this.to,
  });

  @override
  State<SeatPage> createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  @override
  void initState() {
    super.initState();
    // تحميل الكراسي عند فتح الصفحة
    context.read<SeatSelectionCubit>().loadSeats(60);
  }

  int getSeatPrice() {
    if (widget.trainNumber == 185) return 75;
    if (widget.trainNumber == 2009) return 150;
    if (widget.trainNumber == 2031) return 200;
    return 100;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Seat Selection")),
      body: BlocBuilder<SeatSelectionCubit, SeatSelectionState>(
        builder: (context, state) {
          if (state is SeatSelectionLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is SeatSelectionFailure) {
            return Center(child: Text(state.error));
          }

          if (state is SeatSelectionLoaded) {
            final selectedSeats = state.seats
                .where((seat) => seat.status == SeatStatus.selected)
                .toList();
            final totalPrice = selectedSeats.length * getSeatPrice();

            return Column(
              children: [
                const HeaderWidget(),
                SeatGridWidget(seatCount: 60, trainType: "VIP"),
                if (selectedSeats.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      "Total: $totalPrice EGP",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ),
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
                                train: widget.trainNumber.toString(),
                                trainType: "VIP",
                                coach: "1",
                                seats: selectedSeats,
                                from: widget.from,
                                to: widget.to,
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
          }

          return const SizedBox();
        },
      ),
    );
  }
}
