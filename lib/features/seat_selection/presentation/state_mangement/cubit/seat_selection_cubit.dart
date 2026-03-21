import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'seat_selection_state.dart';

class SeatSelectionCubit extends Cubit<SeatSelectionState> {
  SeatSelectionCubit() : super(SeatSelectionInitial());
}
