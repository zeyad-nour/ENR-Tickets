import 'package:enr_tickets/core/widget/app_lottie_lodaing.dart';
import 'package:enr_tickets/features/search_result/presentation/state_mangement/search_result_cubit/search_result_cubit.dart';
import 'package:enr_tickets/features/search_result/presentation/state_mangement/search_result_cubit/search_result_state.dart';
import 'package:enr_tickets/features/search_result/presentation/view/widgets/custom_card_train_info.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultsBody extends StatelessWidget {
  const SearchResultsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SearchResultCubit, SearchResultState>(
        builder: (context, state) {
          if (state is SearchResultLoading) {
            return const Center(
              child: AppLottieLoading(
                assetPath: 'assets/search_result.json',
                size: 150,
                text: "Searching for trips...",
              ),
            ); //replaced
          }

          if (state is SearchResultSuccess) {
            return ListView.builder(
              itemCount: state.trains.length,
              itemBuilder: (context, index) {
                final trip = state.trains[index];

                return CustomCardTrainInfo(
                  trainNumber: trip.trainNumber,
                  classType: trip.trainType,
                  fromStation: trip.from,
                  toStation: trip.to,
                  departTime: trip.departureTime,
                  arriveTime: trip.arrivalTime,

                  duration: trip.duration,
                  availableTickets: trip.availableTickets,
                  tripId: trip.tripId,
                );
              },
            );
          }

          if (state is SearchResultFailure) {
            return Center(child: Text(state.errorMessage));
          }

          return const SizedBox();
        },
      ),
    );
  }
}
