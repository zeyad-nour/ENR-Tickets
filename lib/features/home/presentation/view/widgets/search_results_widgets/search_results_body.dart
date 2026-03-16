import 'package:enr_tickets/features/home/presentation/view/widgets/search_results_widgets/custom_app_bar_search_results.dart';
import 'package:enr_tickets/features/home/presentation/view/widgets/search_results_widgets/custom_card_train_info_list_veiw.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SearchResultsBody extends StatelessWidget {
  const SearchResultsBody({super.key});

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
            const Expanded(
              child: CustomCardTrainInfoListVeiw(),
            ),
          ],
        ),
      ),
    );
  }
}

// backgroundSearchReasult,