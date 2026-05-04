import 'package:dartz/dartz.dart';
import 'package:enr_tickets/core/services/error/failures.dart';
import 'package:enr_tickets/features/search_result/data/model/trip_search_response.dart';

abstract class SearchTripsRepo {
  Future<Either<Failure, TripSearchResponse>> searchTrips({
    required String from,
    required String to,
    required String date,
    int page,
    int limit,
  });
}