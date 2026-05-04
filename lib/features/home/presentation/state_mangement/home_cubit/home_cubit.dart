import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:enr_tickets/features/home/data/model/station_model/station_model.dart';
import 'package:enr_tickets/features/home/data/repo/station_repo.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final StationRepo stationRepo;

  HomeCubit(this.stationRepo) : super(HomeInitial());

  List<StationModel> _stations = [];
  List<StationModel> get stations => _stations;

  StationModel? fromStation;
  StationModel? toStation;

  DateTime travelDate = DateTime.now();

  Future<void> getStations() async {
    emit(HomeLoding());

    try {
      final result = await stationRepo.getStations();
      _stations = result;

      emit(HomeSuccess(stations: _stations));
    } catch (e) {
      emit(HomeFailure(errorMessage: e.toString()));
    }
  }

  void updateStations(StationModel from, StationModel to) {
    fromStation = from;
    toStation = to;

    emit(HomeSuccess(stations: _stations));
  }

void searchTrip() {
  if (fromStation == null || toStation == null) {
    emit(HomeFailure(errorMessage: "Please choose stations correctly"));
    return;
  }

  log("FROM ID: ${fromStation!.id}");
  log("TO ID: ${toStation!.id}");

  emit(HomeSearchSuccess(
    from: fromStation!.id,   
    to: toStation!.id,     
    date: travelDate,
    stopStation: [],
  ));
}

    void updateDate(DateTime date) {
    travelDate = date;
    emit(HomeSuccess(stations: _stations));
  }
}



