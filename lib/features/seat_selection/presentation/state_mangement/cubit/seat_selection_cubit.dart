// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:enr_tickets/core/services/api/api_service.dart';
import 'package:enr_tickets/features/seat_selection/data/model/seatMode.dart';
import 'package:enr_tickets/features/seat_selection/data/repo/set_repo.dart';
import 'package:meta/meta.dart';

part 'seat_selection_state.dart';

class SeatSelectionCubit extends Cubit<SeatSelectionState> {
  SeatSelectionCubit() : super(SeatSelectionLoading());
final api = ApiService(Dio());
  /// ✅ خد seatCount من بره
Future<void> loadSeats(String tripId) async {
  emit(SeatSelectionLoading());

  try {
    final response = await api.get(
      endpoint: "/users/trips/$tripId/seats",
    );

    final model = SeatResponse.fromJson(response.data);

    emit(SeatSelectionLoaded(seats: model.seats));
  } catch (e) {
    emit(SeatSelectionFailure(e.toString()));
  }
}

  /// اختيار كرسي
  void toggleSeat(int seatNumber) {
    if (state is! SeatSelectionLoaded) return;

    final current = state as SeatSelectionLoaded;

    final updated = current.seats.map((seat) {
      if (seat.number == seatNumber) {
        if (seat.status == SeatStatus.booked) return seat;

        return seat.copyWith(
          status: seat.status == SeatStatus.selected
              ? SeatStatus.available
              : SeatStatus.selected,
        );
      }
      return seat;
    }).toList();

    emit(SeatSelectionLoaded(seats: updated));
  }

  /// الكراسي المختارة
  List<SeatModel> getSelectedSeats() {
    if (state is! SeatSelectionLoaded) return [];

    final current = state as SeatSelectionLoaded;

    return current.seats
        .where((seat) => seat.status == SeatStatus.selected)
        .toList();
  }
}
