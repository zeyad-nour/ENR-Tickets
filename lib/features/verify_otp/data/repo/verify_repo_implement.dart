import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:enr_tickets/core/services/api/api_service.dart';
import 'package:enr_tickets/core/services/api/endpoints.dart';
import 'package:enr_tickets/core/services/error/failures.dart';
import 'package:enr_tickets/features/verify_otp/data/repo/verify_repo.dart';

class VerifyRepoImplement implements VerifyRepo {
  final ApiService apiService;

  VerifyRepoImplement(this.apiService);
  @override
  Future<Either<Failure, void>> verifyOtp(String otp, String email) async {
    try {
      final response = await apiService.post(
        endpoint: EndPoints.verifyOTP,
        data: {"email": email, "otp": otp, "type": "signup"},
      );

      final data = response.data;

      if (data['success'] == true) {
        return right(null);
      } else {
        return left(ServerFailuer(data['msg'] ?? 'Unknown error'));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailuer.fromDioError(e));
      } else {
        return left(ServerFailuer("Unexpected error"));
      }
    }
  }

  @override
  Future<Either<Failure, void>> resendOtp(String email) async {
    try {
      final response = await apiService.post(
        endpoint: EndPoints.resendOTP,
        data: {"email": email},
      );
      final data = response.data;
      if (data['success'] == true) {
        return right(null);
      } else {
        return left(ServerFailuer(data['msg'] ?? 'Unknown error'));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailuer.fromDioError(e));
      } else {
        return left(ServerFailuer("Unexpected error"));
      }
    }
  }
}
