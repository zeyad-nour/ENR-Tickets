// ignore_for_file: use_build_context_synchronously

import 'package:enr_tickets/core/utils/app_strings.dart';
import 'package:enr_tickets/core/widget/animated_button.dart';
import 'package:enr_tickets/core/widget/custom_button_register.dart';
import 'package:enr_tickets/core/widget/styles.dart';
import 'package:enr_tickets/features/home/presentation/state_mangement/home_cubit/home_cubit.dart';
import 'package:enr_tickets/features/search_result/presentation/view/search_results_page.dart';
import 'package:enr_tickets/features/home/presentation/view/widgets/home_widgets/custom_home_logo.dart';
import 'package:enr_tickets/features/home/presentation/view/widgets/home_widgets/custom_selection_view.dart';
import 'package:enr_tickets/features/home/presentation/view/widgets/home_widgets/travel_date_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<HomeCubit>().getStations();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeSearchSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => SearchResultsPage(
                stopStations: state.stopStation,
                from: state.from,
                to: state.to,
                trainNumber: 125,
                availableTickets: 30,
                stops: state.stopStation.length,
                classType: 'ثالثة مكيف',
                departTime: '1.5',
                arriveTime: '8.5',
                departDate: state.date,
                arriveDate: '19/3/2026',
                price: '350',
              ),
            ),
          );
        }

        if (state is HomeFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final cubit = context.watch<HomeCubit>();

          /// 🔥 loading state
          if (state is HomeLoding) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          return SafeArea(
            child: Scaffold(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomHomeLogo(),

                    Text(
                      AppStrings.of(context, "headHomePage"),
                      style: Styles.textStyle27.copyWith(
                        color: Theme.of(context).textTheme.bodyLarge!.color,
                      ),
                    ),

                    /// Stations
                    CustomSelectionView(
            fromStation: cubit.fromStation ?? cubit.stations.first,
               toStation: cubit.toStation ?? cubit.stations.first,
                      onStationsChanged: (from, to) {
                        cubit.updateStations(from, to);
                      },
                     stations: cubit.stations,

                    ),

                    const Gap(40),

                    /// Travel Date
                    TravelDateCard(
                      title: AppStrings.of(context, "travelDate"),
                      date:
                          "${cubit.travelDate.day}/${cubit.travelDate.month}/${cubit.travelDate.year}",
                      onTap: () async {
                        DateTime now = DateTime.now();

                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: cubit.travelDate.isBefore(now)
                              ? now
                              : cubit.travelDate,
                          firstDate: now,
                          lastDate: now.add(const Duration(days: 18)),
                        );

                        if (pickedDate != null) {
                          cubit.updateDate(pickedDate);
                        }
                      },
                    ),

                    const Gap(80),

                    /// Search Button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: AnimatedButton(
                        child: VerifyButton(
                          title: AppStrings.of(context, "search"),
                          onTap: () {
                            context.read<HomeCubit>().searchTrip();
                          },
                        ),
                      ),
                    ),

                    const Gap(20),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
