import 'package:bloc/bloc.dart';
import 'package:enr_tickets/core/services/error/failures.dart';
import 'package:enr_tickets/features/search_result/data/model/trip_search_response.dart';
import 'package:enr_tickets/features/search_result/data/repo/search_trips_repo.dart';
import 'package:enr_tickets/features/search_result/presentation/state_mangement/search_result_cubit/search_result_state.dart';


class SearchResultCubit extends Cubit<SearchResultState> {
  final SearchTripsRepo repo;

  SearchResultCubit(this.repo) : super(SearchResultInitial());

  Future<void> fetchResults({
    required String from,
    required String to,
    required String date,
  }) async {
    emit(SearchResultLoading());

    final result = await repo.searchTrips(
      from: from,
      to: to,
      date: date,
    );

    result.fold(
      (Failure failure) {
        emit(SearchResultFailure(errorMessage: failure.errorMessage));
      },
      (TripSearchResponse response) {
        emit(SearchResultSuccess(trains: response.trips));
      },
    );
  }
}