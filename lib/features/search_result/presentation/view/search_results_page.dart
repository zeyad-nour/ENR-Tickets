import 'package:dio/dio.dart';
import 'package:enr_tickets/core/services/api/api_service.dart';
import 'package:enr_tickets/features/search_result/data/repo/search_trips_repo_implement.dart';
import 'package:enr_tickets/features/search_result/presentation/state_mangement/search_result_cubit/search_result_cubit.dart';
import 'package:enr_tickets/features/search_result/presentation/view/widgets/search_results_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultsPage extends StatelessWidget {
  final String from;
  final String to;
  final String date;

  const SearchResultsPage({
    super.key,
    required this.from,
    required this.to,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    final dio = Dio();
final api = ApiService(dio);
final repo = SearchTripsRepoImpl(api);
    return BlocProvider(
      create: (context) =>
        SearchResultCubit(repo)
            ..fetchResults(from: from, to: to, date: date),
      child: SearchResultsBody(),
    );
  }
}
