import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  /// Stations list
  List<String> stations = [];

  /// Selected Data
  String fromStation = "From Station";
  String toStation = "To Station";
  String tripType = "roundTrip";
  DateTime travelDate = DateTime.now();

  /// Load Stations (later from API)
  Future<void> getStations() async {
    try {
      emit(HomeLoding());

      // TODO: replace with API later
      await Future.delayed(const Duration(seconds: 2));

      stations = [
        "Cairo",
        "Giza",
        "Alexandria",
        "Tanta",
        "Mansoura",
        "Assiut",
        "Sohag",
        "Qena",
        "Luxor",
        "Aswan",
      ];

      emit(HomeSuccess(stations: stations));
    } catch (e) {
      emit(HomeFailure(errorMessage: e.toString()));
    }
  }

  /// Update Stations
  void updateStations(String from, String to) {
    fromStation = from;
    toStation = to;
    emit(HomeSuccess(stations: stations));
  }

  /// Update Date
  void updateDate(DateTime date) {
    travelDate = date;
    emit(HomeSuccess(stations: stations));
  }

  /// Update Trip Type
  void updateTripType(String type) {
    tripType = type;
    emit(HomeSuccess(stations: stations));
  }

  /// Search Trip
  void searchTrip() {
    if (fromStation == "From Station" || toStation == "To Station") {
      emit(HomeFailure(errorMessage: "Please choose stations correctly"));
      return;
    }

    emit(HomeSearchSuccess(
      from: fromStation,
      to: toStation,
      date: travelDate,
      tripType: tripType,
    ));
  }
}