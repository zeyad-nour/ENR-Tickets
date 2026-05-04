
import 'package:enr_tickets/features/search_result/data/model/trip_model.dart';

sealed class SearchResultState {}

class SearchResultInitial extends SearchResultState {}

class SearchResultLoading extends SearchResultState {}

class SearchResultSuccess extends SearchResultState {
  final List<TripModel> trains;

  SearchResultSuccess({required this.trains});
}

class SearchResultFailure extends SearchResultState {
  final String errorMessage;

  SearchResultFailure({required this.errorMessage});
}