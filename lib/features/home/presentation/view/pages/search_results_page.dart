import 'package:enr_tickets/features/home/presentation/view/widgets/search_results_widgets/search_results_body.dart';
import 'package:flutter/material.dart';

class SearchResultsPage extends StatelessWidget {
  final String from;
  final String to;
  const SearchResultsPage({
    super.key,
     required this.from, required this.to,
  });

  @override
  Widget build(BuildContext context) {
    return SearchResultsBody(fromStation: from, toStation: to);
  }
}
