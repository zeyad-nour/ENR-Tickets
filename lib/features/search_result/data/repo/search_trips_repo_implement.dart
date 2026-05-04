import 'package:dartz/dartz.dart';
import 'package:enr_tickets/core/services/api/api_service.dart';
import 'package:enr_tickets/core/services/api/endpoints.dart';
import 'package:enr_tickets/core/services/error/failures.dart';

import 'package:enr_tickets/features/search_result/data/model/trip_search_response.dart';
import 'search_trips_repo.dart';

class SearchTripsRepoImpl implements SearchTripsRepo {
  final ApiService api;

  SearchTripsRepoImpl(this.api);

  @override
  Future<Either<Failure, TripSearchResponse>> searchTrips({
    required String from,
    required String to,
    required String date,
    int page = 1,
    int limit = 10,
  }) async {
    try {
      print("FROM = $from");
      print("TO = $to");
      print("DATE = $date");
      final response = await api.get(
        endpoint: EndPoints.searchTrips,
        query: {
          "from": from,
          "to": to,
          "date": date,
          "page": page,
          "limit": limit,
        },
      );

      final model = TripSearchResponse.fromJson(response.data);

      return Right(model);
    } catch (e) {
      return Left(ServerFailuer(e.toString()));
    }
  }
}
