import 'package:bloc/bloc.dart';
import 'package:enr_tickets/features/home/data/model/model.dart';
import 'package:meta/meta.dart';

part 'search_result_state.dart';

class SearchResultCubit extends Cubit<SearchResultState> {
  SearchResultCubit() : super(SearchResultInitial());

  Future<void> fetchResults({
    required String classType,
    required String from,
    required String to,
    required String departTime,
    required String arriveTime,
    required String departDate,
    required String arriveDate,
    required String duration,
   
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
          classType: classType,
          fromStation: from,
          toStation: to,
          departTime: departTime,
          arriveTime: arriveTime,
          departDate: departDate,
          arriveDate: arriveDate,
          duration:duration,
        ),
      ];

      emit(SearchResultSuccess(trains: trains));
    } catch (e) {
      emit(SearchResultFailure(errorMessage: e.toString()));
    }
  }
}
