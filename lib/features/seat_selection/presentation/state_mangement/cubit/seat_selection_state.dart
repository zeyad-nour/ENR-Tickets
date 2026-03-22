part of 'seat_selection_cubit.dart';

@immutable
sealed class SeatSelectionState {}

final class SeatSelectionInitial extends SeatSelectionState {}



final class SeatSelectionLoaded extends SeatSelectionState {
  final List<SeatModel> seats;

  SeatSelectionLoaded({required this.seats});
}




// loading
// success
// falier

//  booking , selected , Availabel 