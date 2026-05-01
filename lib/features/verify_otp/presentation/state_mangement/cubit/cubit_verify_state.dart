part of 'cubit_verify_cubit.dart';

sealed class CubitVerifyState extends Equatable {
  const CubitVerifyState();

  @override
  List<Object> get props => [];
}

final class CubitVerifyInitial extends CubitVerifyState {}

final class CubitVerifyLoding extends CubitVerifyState {}

final class CubitVerifySucsess extends CubitVerifyState {}

final class CubitVerifyFailure extends CubitVerifyState {
  final String errorMessage;

  const CubitVerifyFailure({required this.errorMessage});
}

final class CubitVerifyResend extends CubitVerifyState {}
