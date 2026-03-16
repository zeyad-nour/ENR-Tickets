import 'package:enr_tickets/features/home/presentation/view/widgets/search_results_widgets/custom_app_bar_search_results.dart';
import 'package:enr_tickets/features/home/presentation/view/widgets/search_results_widgets/custom_card_train_info_list_veiw.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SearchResultsBody extends StatelessWidget {
  final String fromStation;
  final String toStation;
  const SearchResultsBody({
    super.key,
    required this.fromStation,
    required this.toStation,
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
                classType: "ثالثة مكيف",
                fromStation: fromStation, //
                toStation: toStation, //
                departTime: "departTime",
                arriveTime: "arriveTime",
                departDate: "departDate",
                arriveDate: "arriveDate",
                duration: "duration",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// backgroundSearchReasult,
