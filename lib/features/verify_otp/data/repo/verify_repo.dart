import 'package:dartz/dartz.dart';
import 'package:enr_tickets/core/services/error/failures.dart';

abstract class VerifyRepo { 
  Future<Either<Failure,void>> verifyOtp(String otp);
  // Future<void> resendOtp(String email);
}



//resend otp
//verify otp =>true or false
