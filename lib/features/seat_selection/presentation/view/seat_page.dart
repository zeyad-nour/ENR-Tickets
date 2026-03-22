import 'package:enr_tickets/features/seat_selection/data/model/seatMode.dart'
    show SeatStatus;
import 'package:enr_tickets/features/seat_selection/presentation/state_mangement/cubit/seat_selection_cubit.dart';
import 'package:enr_tickets/features/seat_selection/presentation/view/widgets/booking_botton.dart';
import 'package:enr_tickets/features/seat_selection/presentation/view/widgets/header_widget.dart';
import 'package:enr_tickets/features/seat_selection/presentation/view/widgets/seat_grid_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class SeatPage extends StatelessWidget {
  const SeatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SeatSelectionCubit()..loadSeats(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(title: const Text("Select Seat")),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const HeaderWidget(),
                  const SizedBox(height: 20),
                  const SeatGridWidget(),
                  const Gap(10),

                  BlocBuilder<SeatSelectionCubit, SeatSelectionState>(
                    builder: (context, state) {
                      bool hasSelection = false;

                      if (state is SeatSelectionLoaded) {
                        hasSelection = state.seats.any(
                          (seat) => seat.status == SeatStatus.selected,
                        );
                      }

                      return BookingBotton(
                        onPressed: hasSelection
                            ? () {
                                final cubit = context
                                    .read<SeatSelectionCubit>();
                                final selectedSeats = cubit.getSelectedSeats();
                                print(selectedSeats);
                              }
                            : null,
                      );
                    },
                  ),

                  const Gap(10),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
