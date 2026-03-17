import 'package:enr_tickets/features/home/presentation/state_mangement/search_result_cubit/search_result_cubit.dart';
import 'package:enr_tickets/features/home/presentation/view/widgets/search_results_widgets/custom_app_bar_search_results.dart';
import 'package:enr_tickets/features/home/presentation/view/widgets/search_results_widgets/custom_card_train_info_list_veiw.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    required this.toStation,
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<SearchResultCubit, SearchResultState>(
        builder: (context, state) {
          if (state is SearchResultLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is SearchResultSuccess) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: Column(
                children: [
                  const Gap(30),

                  //Fixed
                  CustomAppBarSearchResults(arriveStation: toStation),

                  // Scrolling
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.trains.length,

                      itemBuilder: (context, index) {
                        return CustomCardTrainInfoListVeiw(
                          trainNumber: 135, //done
                          availableTickets: 32, //done
                          stops: 21, //done
                          classType: classType, //done
                          fromStation: fromStation, //done
                          toStation: toStation, //done
                          departTime: departTime, //done
                          arriveTime: arriveTime, //done
                          departDate: departDate, //done
                          arriveDate: arriveDate, //done
                          duration: duration, //done
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          } else if (state is SearchResultFailure) {
            return Center(child: Text(state.errorMessage));
          }
          return SizedBox();
        },
      ),
    );
  }
}

// backgroundSearchReasult,
