part of 'search_result_cubit.dart';

@immutable
sealed class SearchResultState {}

final class SearchResultInitial extends SearchResultState {}

final class SearchResultLoading extends SearchResultState {}

final class SearchResultSuccess extends SearchResultState {
  final List<TrainInfo> trains; // نموذج بيانات كل رحلة
  SearchResultSuccess({required this.trains});
}

final class SearchResultFailure extends SearchResultState {
  final String errorMessage;
  SearchResultFailure({required this.errorMessage});
}

// نموذج بيانات للرحلة
class TrainInfo {
  final int trainNumber;
  final int availableTickets;
  final int stops;
  final String classType;
  final String fromStation;
  final String toStation;
  final String departTime;
  final String arriveTime;
  final String departDate;
  final String arriveDate;
  final String duration;

  TrainInfo({
    required this.trainNumber,
    required this.availableTickets,
    required this.stops,
    required this.classType,
    required this.fromStation,
    required this.toStation,
    required this.departTime,
    required this.arriveTime,
    required this.departDate,
    required this.arriveDate,
    required this.duration,
  });
}