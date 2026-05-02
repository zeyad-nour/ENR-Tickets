import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:enr_tickets/features/verify_otp/data/repo/verify_repo.dart';

part 'cubit_verify_state.dart';

class CubitVerifyCubit extends Cubit<CubitVerifyState> {
  final VerifyRepo verifyRepo;

  CubitVerifyCubit(this.verifyRepo) : super(CubitVerifyInitial());

  Future<void> verifyOtp(String otp, String email) async {
    emit(CubitVerifyLoding());

    final result = await verifyRepo.verifyOtp(otp, email);

    result.fold(
      (failure) {
        emit(CubitVerifyFailure(errorMessage: failure.errorMessage));
      },
      (_) {
        emit(CubitVerifySucsess());
      },
    );
  }

Future<void> resendOtp(String email) async {
  emit(CubitVerifyLoding());

  final result = await verifyRepo.resendOtp(email);

  result.fold(
    (failure) {
      emit(CubitVerifyFailure(errorMessage: failure.errorMessage));
    },
    (_) {
      emit(CubitVerifyResend()); 
    },
  );
}
}
