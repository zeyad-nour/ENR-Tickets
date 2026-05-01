import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cubit_verify_state.dart';

class CubitVerifyCubit extends Cubit<CubitVerifyState> {
  CubitVerifyCubit() : super(CubitVerifyInitial());
}
