import 'package:enr_tickets/core/utils/colors.dart';
import 'package:enr_tickets/features/home/presentation/view/widgets/custom_app_bar_search_results.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SearchResultsBody extends StatelessWidget {
  const SearchResultsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundSearchReasult,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        child: Column(children: [Gap(30), CustomAppBarSearchResults()]),
      ),
    );
  }
}
