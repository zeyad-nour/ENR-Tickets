import 'package:bloc/bloc.dart';
import 'package:enr_tickets/features/home/data/model/model.dart';
import 'package:meta/meta.dart';

part 'search_result_state.dart';

class SearchResultCubit extends Cubit<SearchResultState> {
  SearchResultCubit() : super(SearchResultInitial());

  Future<void> fetchResults({
    required String from,
    required String to,
    required DateTime date,
  }) async {
    try {
      emit(SearchResultLoading());

      // محاكاة جلب بيانات من API
      await Future.delayed(Duration(seconds: 5));

      final trains = <TrainInfo>[
        TrainInfo(
          trainNumber: 135,
          availableTickets: 32,
          stops: 3,
          classType: "ثالثة مكيفة (13)",
          fromStation: from,
          toStation: to,
          departTime: "08:45",
          arriveTime: "10:45",
          departDate: "2026.02.16",
          arriveDate: "2026.02.16",
          duration: "02:00",
        ),
      ];

      emit(SearchResultSuccess(trains: trains));
    } catch (e) {
      emit(SearchResultFailure(errorMessage: e.toString()));
    }
  }
}
