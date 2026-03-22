import 'package:enr_tickets/features/seat_selection/presentation/state_mangement/cubit/seat_selection_cubit.dart';
import 'package:enr_tickets/features/seat_selection/presentation/view/widgets/header_widget.dart';
import 'package:enr_tickets/features/seat_selection/presentation/view/widgets/seat_grid_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeatPage extends StatelessWidget {
  const SeatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SeatSelectionCubit()..initSeats(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Select Seat")),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: const [
              HeaderWidget(),
              SizedBox(height: 20),
              SeatGridWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
