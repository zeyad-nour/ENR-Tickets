import 'package:bloc/bloc.dart';
import 'package:enr_tickets/features/seat_selection/data/model/seatMode.dart';
import 'package:meta/meta.dart';

part 'seat_selection_state.dart';

class SeatSelectionCubit extends Cubit<SeatSelectionState> {
  SeatSelectionCubit() : super(SeatSelectionInitial());

  /// initialize seats (ممكن من API أو dummy data)
  void initSeats() {
    final seats = List.generate(28, (index) {
      return SeatModel(
        number: index + 1,
        status: SeatStatus.available,
      );
    });

    emit(SeatSelectionLoaded(seats: seats));
  }

  /// اختيار/إلغاء اختيار كرسي
  void toggleSeat(int seatNumber) {
    if (state is! SeatSelectionLoaded) return;

    final currentState = state as SeatSelectionLoaded;

    final updatedSeats = currentState.seats.map((seat) {
      if (seat.number == seatNumber) {
        if (seat.status == SeatStatus.booked) {
          return seat; // مينفعش يتغير
        }

        return seat.copyWith(
          status: seat.status == SeatStatus.selected
              ? SeatStatus.available
              : SeatStatus.selected,
        );
      }
      return seat;
    }).toList();

    emit(SeatSelectionLoaded(seats: updatedSeats));
  }
}