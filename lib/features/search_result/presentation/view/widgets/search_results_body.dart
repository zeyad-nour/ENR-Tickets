import 'package:enr_tickets/core/utils/app_strings.dart';
import 'package:enr_tickets/core/widget/app_lottie_lodaing.dart';
import 'package:enr_tickets/features/search_result/presentation/state_mangement/search_result_cubit/search_result_cubit.dart';
import 'package:enr_tickets/features/search_result/presentation/state_mangement/search_result_cubit/search_result_state.dart';
import 'package:enr_tickets/features/search_result/presentation/view/widgets/custom_app_bar_search_results.dart';
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
            return const Center(child: CircularProgressIndicator());//
          }

          if (state is SearchResultSuccess) {
            return ListView.builder(
              itemCount: state.trains.length,
              itemBuilder: (context, index) {
                final trip = state.trains[index];

                return ListTile(
                  title: Text("${trip.trainNumber} - ${trip.trainType}"),
                  subtitle: Text(
                    "${trip.from} → ${trip.to}\n"
                    "${trip.departureTime} - ${trip.arrivalTime}",
                  ),
                  trailing: Text("${trip.price} EGP"),
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