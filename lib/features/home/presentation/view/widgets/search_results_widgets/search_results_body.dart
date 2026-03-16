import 'package:enr_tickets/features/home/presentation/view/widgets/search_results_widgets/custom_app_bar_search_results.dart';
import 'package:enr_tickets/features/home/presentation/view/widgets/search_results_widgets/custom_card_train_info_list_veiw.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SearchResultsBody extends StatelessWidget {
  final int trainNumber;
  final int availableTickets;
  final int stops;
  final String fromStation;
  final String toStation;
  final String classType;
  final String departTime;
  final String arriveTime;
  final String departDate;
  final String arriveDate;
  final String duration;
  const SearchResultsBody({
    super.key,
    required this.fromStation,
    required this.toStation, required this.trainNumber, required this.availableTickets, required this.stops, required this.classType, required this.departTime, required this.arriveTime, required this.departDate, required this.arriveDate, required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        child: Column(
          children: [
            const Gap(30),

            //Fixed
            CustomAppBarSearchResults(arriveStation: ''),

            // Scrolling
            Expanded(
              child: CustomCardTrainInfoListVeiw(
                trainNumber: 135,
                availableTickets: 32,
                stops: 21,
                classType: classType,
                fromStation: fromStation, //
                toStation: toStation, //
                departTime: departTime,
                arriveTime: arriveTime,
                departDate: departDate,
                arriveDate: arriveDate,
                duration: duration,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// backgroundSearchReasult,
