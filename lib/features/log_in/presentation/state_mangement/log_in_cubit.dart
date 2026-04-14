// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:enr_tickets/core/services/error/failures.dart';
import 'package:enr_tickets/features/log_in/data/model/LoginModel/log.in_model.dart';
import 'package:enr_tickets/features/log_in/data/repo/login_repo.dart';
import 'package:meta/meta.dart';

part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  final LogInRepo logInRepo;

  LogInCubit(this.logInRepo) : super(LogInInitial());

  Future<void> logIn({
    required String email,
    required String password,
  }) async {
    emit(LogInLoding());

    final result = await logInRepo.logIn(
      email: email,
      password: password,
    );

    result.fold(
      (Failure failure) {
        emit(LogInFailure(error: failure.errorMessage));
      },
      (LogInModel model) {
        emit(LogInSuccess(model: model));
      },
    );
  }
}