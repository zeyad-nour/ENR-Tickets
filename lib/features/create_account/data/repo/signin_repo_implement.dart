import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:enr_tickets/core/services/api/api_service.dart';
import 'package:enr_tickets/core/services/api/endpoints.dart';
import 'package:enr_tickets/core/services/error/failures.dart';
import 'package:enr_tickets/features/create_account/data/model/singin_model/singin_model.dart';
import 'package:enr_tickets/features/create_account/data/repo/signin_repo.dart';

class SigninRepoImplement implements SigninRepo {
  final ApiService apiService;

  SigninRepoImplement(this.apiService);

  @override
  Future<Either<Failure, SinginModel>> signin({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      // ignore: avoid_print
  
      final response = await apiService.post(
        endpoint: EndPoints.signup,
        data: {
          "name": name,
          "email": email,
          "phone": phone,
          "password": password,
          "confirmPassword": confirmPassword,
        },
      );

      final model = SinginModel.fromJson(response.data);

      return Right(model);
    } on DioException catch (e) {
      return Left(ServerFailuer.fromDioError(e));
    }
  }
}
