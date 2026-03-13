import 'package:flutter/material.dart';

class SearchResults extends StatelessWidget {
  final DateTime date;
  final String fromStation;
  final String toStation;
  final int numberofTickets;
  const SearchResults({
    super.key,
    required this.date,
    required this.fromStation,
    required this.toStation,
    required this.numberofTickets,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [Center(child: Text("Search results"))]),
    );
  }
}
