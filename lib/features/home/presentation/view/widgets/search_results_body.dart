import 'package:enr_tickets/features/home/presentation/view/widgets/custom_app_bar_search_results.dart';
import 'package:enr_tickets/features/home/presentation/view/widgets/custom_card_train_info_list_veiw.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SearchResultsBody extends StatelessWidget {
  const SearchResultsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: CustomAppBarSearchResults(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Gap(30),
              CustomAppBarSearchResults(),
              CustomCardTrainInfoListVeiw(),
            ],
          ),
        ),
      ),
    );
  }
}


// backgroundSearchReasult,