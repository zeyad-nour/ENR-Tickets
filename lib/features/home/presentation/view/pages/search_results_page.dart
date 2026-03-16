import 'package:enr_tickets/features/home/presentation/view/widgets/search_results_widgets/search_results_body.dart';
import 'package:flutter/material.dart';

class SearchResultsPage extends StatelessWidget {
  final int trainNumber;
  final int availableTickets;
  final int stops;
  final String classType;
  final String departTime;
  final String arriveTime;
  final String departDate;
  final String arriveDate;
  final String duration;
  final String from;
  final String to;
  const SearchResultsPage({
    super.key,
    required this.from,
    required this.to,
    required this.trainNumber,
    required this.availableTickets,
    required this.stops,
    required this.classType,
    required this.departTime,
    required this.arriveTime,
    required this.departDate,
    required this.arriveDate,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return SearchResultsBody(
      fromStation: from,
      toStation: to,
      trainNumber: trainNumber,
      availableTickets: availableTickets,
      stops: stops,
      classType: classType,
      departTime: departTime,
      arriveTime: arriveTime,
      departDate: departDate,
      arriveDate: arriveDate,
      duration: duration,
    );
  }
}
