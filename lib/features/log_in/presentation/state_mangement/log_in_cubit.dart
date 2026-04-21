// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:enr_tickets/core/services/error/failures.dart';
import 'package:enr_tickets/features/log_in/data/model/LoginModel/log.in_model.dart';
import 'package:enr_tickets/features/log_in/data/repo/login_repo.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  final LogInRepo logInRepo;

  LogInCubit(this.logInRepo) : super(LogInInitial());

  Future<void> logIn({required String email, required String password}) async {
    emit(LogInLoding());

    final result = await logInRepo.logIn(email: email, password: password);

    result.fold(
      (Failure failure) {
        emit(LogInFailure(error: failure.errorMessage));
      },
      (LogInModel model) async {
        // ✅ Save token + login state
        if (model.token != null) {
          await saveToken(model.token!);
          await saveLoggedIn(true);
        }

        emit(LogInSuccess(model: model));
      },
    );
  }

  /// =========================
  /// Local Storage Functions
  /// =========================

  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  static Future<void> saveLoggedIn(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', value);
  }

  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }
}
