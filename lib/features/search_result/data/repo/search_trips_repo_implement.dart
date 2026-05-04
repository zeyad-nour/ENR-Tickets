import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:enr_tickets/core/services/api/endpoints.dart';
import 'package:enr_tickets/core/services/error/failures.dart';

import 'package:enr_tickets/features/search_result/data/model/trip_search_response.dart';
import 'search_trips_repo.dart';

class SearchTripsRepoImpl implements SearchTripsRepo {
  final Dio dio;

  SearchTripsRepoImpl(this.dio);

  @override
  Future<Either<Failure, TripSearchResponse>> searchTrips({
    required String from,
    required String to,
    required String date,
    int page = 1,
    int limit = 10,
  }) async {
    try {
      final response = await dio.get(
        EndPoints.searchTrips,
        queryParameters: {
          "from": from,
          "to": to,
          "date": date,
          "page": page,
          "limit": limit,
        },
      );

      final model = TripSearchResponse.fromJson(response.data);

      return Right(model);
    } on DioException catch (e) {
      return Left(
        ServerFailuer(e.message ?? 'An error occurred while fetching trips.'),
      );
    } catch (e) {
      return Left(ServerFailuer(e.toString()));
    }
  }
}
