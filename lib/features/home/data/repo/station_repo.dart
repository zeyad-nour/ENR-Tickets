import 'package:enr_tickets/features/home/data/model/station_model/station_model.dart';

abstract class StationRepo {
  Future<List<StationModel>> getStations();
}