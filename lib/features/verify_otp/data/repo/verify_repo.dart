import 'package:dartz/dartz.dart';
import 'package:enr_tickets/core/services/error/failures.dart';

abstract class VerifyRepo { 
  Future<Either<Failure,void>> verifyOtp(String otp,String email);
  // Future<void> resendOtp(String email);
}



//resend otp
//verify otp =>true or false
