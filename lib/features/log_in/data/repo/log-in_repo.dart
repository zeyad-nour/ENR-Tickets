import 'package:dartz/dartz.dart';
import 'package:enr_tickets/core/services/error/failures.dart';
import 'package:enr_tickets/features/log_in/data/model/LoginModel/log.in_model.dart';

abstract class LogInRepo { 
  Future<Either<Failure, LogIn>> logIn({required String email, required String password});
}
